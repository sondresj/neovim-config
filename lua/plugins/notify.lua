local notify = require("mini.notify")
notify.setup({})
vim.notify = notify.make_notify({
	ERROR = { duration = 5000 },
	WARN = { duration = 4000 },
	INFO = { duration = 3000 },
})

-- local M = {}
--
-- m.info = function(msg)
-- 	vim.notify(msg, vim.log.levels.INFO)
-- end
-- return M
