local util = require("util")
local M = {}

-- TODO: Cache this
local function get_plugin_count()
	local rtp = vim.opt.runtimepath:get()
	local plugins = 0

	for _, path in ipairs(rtp) do
		if path:match("site/pack") or path:match("pack") then
			plugins = plugins + 1
		end
	end

	return plugins
end

-- Alternative: count packages
-- local function count_packages()
--     local pack_dir = vim.fn.stdpath("data") .. "/site/pack"
--     local count = 0
--     for _ in vim.fn.glob(pack_dir .. "/*/*/start/*", true, true) do
--         count = count + 1
--     end
--     return count
-- end

local function get_memory_usage()
	if vim.uv and vim.uv.getrusage then
		local usage = vim.uv.getrusage()
		return string.format("%.2f MB", usage.maxrss / 1024)
	end

	-- Fallback for Linux
	if vim.fn.has("unix") == 1 then
		local pid = vim.fn.getpid()
		local f = io.open("/proc/" .. pid .. "/status", "r")
		if f then
			for line in f:lines() do
				if line:match("^VmRSS:") then
					f:close()
					local _, _, kb = line:match("^VmRSS:%s+(%d+)")
					return string.format("%.2f MB", tonumber(kb) / 1024)
				end
			end
			f:close()
		end
	end

	return "N/A"
end

-- TODO: Cache this per file
local function get_editorconfig_status()
	-- Check if editorconfig-nvim is loaded
	if package.loaded["editorconfig"] then
		-- Check if there's an active .editorconfig for current file
		local filepath = vim.api.nvim_buf_get_name(0)
		if filepath ~= "" then
			-- You'd need to check if editorconfig plugin found a config
			-- This depends on the specific plugin implementation
			return "active"
		end
	end
	return "not loaded"
end

M.get_status = function()
	return {
		plugin_count = get_plugin_count(),
		memory = get_memory_usage(),
		editorconfig = get_editorconfig_status(),
	}
end
return M
