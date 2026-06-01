require("mini.icons").setup({})
require("oil").setup({
	use_default_keymaps = false,
	keymaps = {
		["g?"] = { "actions.show_help", mode = "n" },
		["<CR>"] = "actions.select",
		-- ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
		-- ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
		-- ['<C-t>'] = { 'actions.select', opts = { tab = true } },
		-- ['<C-p>'] = 'actions.preview',
		["K"] = "actions.preview",
		-- ['<C-c>'] = { 'actions.close', mode = 'n' },
		["q"] = { "actions.close", mode = "n" },
		["<C-r>"] = "actions.refresh",
		["-"] = { "actions.parent", mode = "n" },
		["_"] = { "actions.open_cwd", mode = "n" },
		["+"] = { "actions.cd", mode = "n" },
		-- ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
		-- ['gs'] = { 'actions.change_sort', mode = 'n' },
		-- ['gx'] = 'actions.open_external',
		["<leader>h"] = { "actions.toggle_hidden", mode = "n" },
		-- ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
	},
	show_hidden = true,
})
-- vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Open Oil (fs editor)" })
vim.keymap.set("n", "<leader>e", function()
	local oil = require("oil")
	local util = require("oil.util")

	oil.open()
	util.run_after_load(0, function()
		oil.open_preview({ preview = true })
		-- oil.select({ preview = true })
	end)
end, { desc = "Open Oil (fs editor)" })
