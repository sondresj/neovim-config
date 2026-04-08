local ensure_installed = {
	"lua_ls",
	"cssls",
	"denols",
	"tsgo",
	-- "eslint_d",
	"rust_analyzer",
	"tailwindcss",
	"openscad_lsp",
	"stylua", -- Used to format Lua code
}

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = ensure_installed,
	automatic_installation = false,
	automatic_enable = true,
})

require("lazydev").setup({
	library = {
		-- Load luvit types when the `vim.uv` word is found
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})
