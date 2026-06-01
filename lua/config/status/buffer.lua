local bit = require("bit")
local util = require("util")
local M = {}

M.get_status = function()
	local buf = vim.api.nvim_get_current_buf()

	-- - file:
	--  - filename
	--  - path
	--  - mode (e.g r-w-0)
	--  - last modified
	local path = vim.api.nvim_buf_get_name(buf)
	local mode_str = "N/A"
	local size = "N/A"
	local stat = vim.uv.fs_stat(path)

	if stat then
		size = util.human_size(stat.size)
		local t = (stat.type == "directory" and "d") or (stat.type == "link" and "l") or "-"

		local mode = stat.mode or 0
		local function tri(bits)
			local r = bit.band(mode, bits.read) ~= 0 and "r" or "-"
			local w = bit.band(mode, bits.write) ~= 0 and "w" or "-"
			local x = bit.band(mode, bits.exec) ~= 0 and "x" or "-"
			return r .. w .. x
		end

		local owner = tri({ read = 0x100, write = 0x080, exec = 0x040 })
		local group = tri({ read = 0x020, write = 0x010, exec = 0x008 })
		local other = tri({ read = 0x004, write = 0x002, exec = 0x001 })

		mode_str = t .. owner .. group .. other
		-- local numeric = string.format("0x%03x", mode & 0xFFF)
	end

	-- TODO: size

	return {
		buf_id = buf,
		encoding = vim.bo.fileencoding,
		format = vim.bo.fileformat,
		lines = vim.api.nvim_buf_line_count(buf),

		filetype = vim.bo.filetype,
		filesize = size,
		filepath = vim.api.nvim_buf_get_name(buf),
		filemode = mode_str,

		modified = vim.bo.modified,
		readonly = vim.bo.readonly,
	}
end
return M
