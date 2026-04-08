local gh = function(repo)
	return "https://github.com/" .. repo
end
local cb = function(repo)
	return "https://codeberg.org/" .. repo
end

vim.pack.add({
	-- gh("rafamadriz/friendly-snippets"),
	-- { src = gh("saghen/blink.cmp"), version = vim.version.range("1.10.x") },
	gh("folke/lazydev.nvim"),
	gh("goolord/alpha-nvim"),
	gh("ibhagwan/fzf-lua"),
	gh("j-hui/fidget.nvim"),
	gh("mason-org/mason-lspconfig.nvim"),
	gh("mason-org/mason.nvim"),
	gh("neovim/nvim-lspconfig"),
	gh("nvim-mini/mini.clue"),
	gh("nvim-mini/mini.diff"),
	gh("nvim-mini/mini.hipatterns"),
	gh("nvim-mini/mini.icons"),
	gh("nvim-mini/mini.notify"),
	gh("nvim-mini/mini.statusline"),
	gh("nvim-mini/mini.tabline"),
	gh("stevearc/oil.nvim"),
	{ src = gh("3rd/image.nvim"), name = "image" },
	{ src = gh("Shatur/neovim-ayu"), name = "ayu" },
	{ src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
	{ src = gh("stevearc/conform.nvim"), name = "conform" },
})

require("fidget").setup({})
require("mini.diff").setup({})
require("mini.icons").setup({})
require("mini.statusline").setup({})
require("mini.tabline").setup({})

require("plugins.ayu")
require("plugins.notify")
require("plugins.greet")
require("plugins.clue")
require("plugins.fmt")
require("plugins.fzf")
require("plugins.hip")
require("plugins.img")
require("plugins.oil")
require("plugins.ts")
require("plugins.lsp")
