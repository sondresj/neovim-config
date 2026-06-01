local util = require("util")
local git = require("config.status.git")
local nvim = require("config.status.nvim")
local ts = require("config.status.ts")
local lsp = require("config.status.lsp")
local health = require("config.status.health")
local buffer = require("config.status.buffer")

--- @alias Config {
--- nvim: boolean?,
--- git: boolean?,
--- lsp: boolean?,
--- ts: boolean?,
--- stat: boolean?,
--- health: boolean?,
--- initial_open: boolean?,
--- }

--- @alias Status {
--- buffer: table,
--- nvim: table,
--- git: table,
--- lsp: table,
--- ["tree-sitter"]: table,
--- health: table,
--- }

--- @alias State {
--- winId: integer?,
--- bufId: integer?,
--- status: Status?,
--- }

local M = {}

--- @type Config
M.config = {
	nvim = true,
	git = true,
	lsp = true,
	ts = true,
	stat = true,
	health = true,
	initial_open = false,
}

--- @type State
M.state = {
	open = false,
	winId = nil,
	bufId = nil,
	status = {},
}

local function on_lsp_event(event)
	local currentBufId = vim.api.nvim_get_current_buf()
	vim.print(
		"on_lsp_event: current buffer "
			.. currentBufId
			.. " status buffer "
			.. M.state.bufId
			.. " event buffer "
			.. (event.buffer or "nil")
	)
	if currentBufId == M.state.bufId then
		return
	end
	if M.state.bufId == event.buffer then
		return
	end

	M.state.status.lsp = lsp.get_status()
	M.state.status["tree-sitter"] = ts.get_status()
	M.render()
end

local function on_buf_event(event)
	local currentBufId = vim.api.nvim_get_current_buf()
	vim.print(
		"on_buf_event: current buffer "
			.. currentBufId
			.. " status buffer "
			.. M.state.bufId
			.. " event buffer "
			.. (event.buffer or "nil")
	)
	if currentBufId == M.state.bufId then
		return
	end
	if M.state.bufId == event.buffer then
		return
	end

	M.state.status.buffer = buffer.get_status()
	M.state.status.git = git.get_status()
	M.render()
end

local function on_show()
	local currentBufId = vim.api.nvim_get_current_buf()
	if currentBufId == M.state.bufId then
		return
	end

	M.update_all()
	M.render()
end

local function on_hide()
	local currentBufId = vim.api.nvim_get_current_buf()
	if currentBufId == M.state.bufId then
		return
	end
end

M.update_all = function()
	if M.state.winId == nil then
		return
	end

	-- TODO: keep a dictionary of all data, and update fields only when needed
	local status = {
		buffer = M.config.stat and buffer.get_status() or {},
		nvim = M.config.nvim and nvim.get_status() or {},
		git = M.config.git and git.get_status() or {},
		lsp = M.config.lsp and lsp.get_status() or {},
		["tree-sitter"] = M.config.ts and ts.get_status() or {},
		health = M.config.health and health.get_status() or {},
	}

	M.state.status = status
end

M.render = function()
	if not M.state.bufId then
		return
	end

	local lines = {}

	for key, value in pairs(M.state.status) do
		table.insert(lines, "==" .. key .. "==")
		for key, value in pairs(value) do
			table.insert(lines, key .. "\t" .. tostring(value))
		end
		table.insert(lines, "")
	end

	vim.api.nvim_buf_set_lines(M.state.bufId, 0, -1, false, lines)
end

M.open = function()
	if M.state.winId ~= nil then
		return
	end

	M.state.bufId = vim.api.nvim_create_buf(false, true)
	M.state.winId = vim.api.nvim_open_win(M.state.bufId, false, {
		split = "right",
		win = 0,
		style = "minimal",
	})

	-- TODO: listen to event for current buffer changed, closed, opened, file changes, lsp clients, etc. to update the status panel
	local groupId = vim.api.nvim_create_augroup("StatusPlugin", { clear = true })
	-- NOTE: read about events here https://neovim.io/doc/user/autocmd/#_5.-events

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
		group = groupId,
		-- callback = util.debounce(on_buf_event, 1500),
		callback = on_buf_event,
	})
	vim.api.nvim_create_autocmd("LspNotify", {
		group = groupId,
		callback = util.debounce(on_lsp_event, 1500),
	})

	-- listen for event of this M.winId being closed, treat as if :StatusClose called
	-- vim.api.nvim_create_autocmd("WinClosed", {
	-- 	group = groupId,
	-- 	callback = function(event)
	-- 		-- FIXME: This doesn't work..
	-- 		if event.group ~= groupId then
	-- 			return
	--            end
	--
	-- 		M.close()
	-- 	end,
	-- })

	vim.schedule(on_show)
end

M.close = function()
	pcall(vim.api.nvim_del_augroup_by_name, "StatusPlugin")

	if M.state.winId ~= nil then
		pcall(vim.api.nvim_win_close, M.state.winId, true)
		M.state.winId = nil
	end

	if M.state.bufId ~= nil then
		pcall(vim.api.nvim_buf_delete, M.state.bufId, { force = true })
		M.state.bufId = nil
	end

	vim.schedule(on_hide)
end

M.toggle = function()
	if M.state.winId ~= nil then
		M.close()
	else
		M.open()
	end
end

---@param config Config?
M.setup = function(config)
	--- @type Config
	local opts = config or {}

	M.config = vim.tbl_deep_extend("keep", opts, M.config)

	vim.api.nvim_create_user_command("StatusClose", M.close, {
		desc = "Toggle (show/hide) status pane",
	})

	vim.api.nvim_create_user_command("Status", M.toggle, {
		desc = "Toggle (show/hide) status pane",
	})

	if M.config.initial_open then
		M.open()
	end
end

return M
