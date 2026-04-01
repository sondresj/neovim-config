vim.pack.add({
	"https://github.com/folke/lazydev.nvim",
	"https://github.com/goolord/alpha-nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-mini/mini.clue",
	"https://github.com/nvim-mini/mini.diff",
	"https://github.com/nvim-mini/mini.hipatterns",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-mini/mini.notify",
	"https://github.com/nvim-mini/mini.statusline",
	"https://github.com/nvim-mini/mini.tabline",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/stevearc/oil.nvim",
	{ src = "https://github.com/3rd/image.nvim", name = "image" },
	{ src = "https://github.com/Shatur/neovim-ayu", name = "ayu" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.10.x") },
	{ src = "https://github.com/stevearc/conform.nvim", name = "conform" },
})

require("plugins.ayu")
require("plugins.blink")
require("plugins.clue")
require("plugins.fmt")
require("plugins.fzf")
require("plugins.greet")
require("plugins.hip")
require("plugins.image")
require("plugins.line")
-- require("plugins.llm")
require("plugins.lsp")
require("plugins.notify")
require("plugins.oil")
-- require("plugins.pairs")
require("plugins.tree")
