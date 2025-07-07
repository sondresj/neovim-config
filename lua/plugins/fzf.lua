return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Fuzzyfind files" })
		vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua resume<CR>", { desc = "Fuzzyfind resume" })
		vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<CR>", { desc = "Fuzzyfind helptags" })
		vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Fuzzyfind buffers" })
		vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep_native<CR>", { desc = "Fuzzyfind grep" })
		vim.keymap.set("n", "<leader>fk", "<cmd>FzfLua keymaps<CR>", { desc = "Fuzzyfind keymaps" })
	end,
}
