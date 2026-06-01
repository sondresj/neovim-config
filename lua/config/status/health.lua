local util = require("util")
local M = {}

-- TODO: Cache this
M.get_status = function()
	local errors = {}
	-- local stdout = {}

	vim.system({ "nvim", "--headless", "-c", "checkhealth" }, {
		text = true,
	}, function(result)
		if result.code == 0 then
			-- Parse stdout for ERROR lines
			for line in result.stdout:gmatch("[^\n]+") do
				if line:match("ERROR") then
					table.insert(errors, line)
				end
			end
		end
	end)

	return errors
end
return M
