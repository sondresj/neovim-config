return {
	"Shatur/neovim-ayu",
	priority = 1000, -- need to load before lualine and bufferline, default is 50, highest is loaded first
	lazy = false,
	config = function()
		local colors = require("ayu.colors")
		colors.generate(false)
		require("ayu").setup({
			overrides = {
				-- a little brighter line numbers
				LineNr = { fg = colors.comment },
				-- transparent background
				Normal = { bg = "None" },
				ColorColumn = { bg = "None" },
				SignColumn = { bg = "None" },
				Folded = { bg = "None" },
				FoldColumn = { bg = "None" },
				CursorLine = { bg = "None" },
				CursorColumn = { bg = "None" },
				WhichKeyFloat = { bg = "None" },
				VertSplit = { bg = "None" },
			},
		})
		-- Load the colorscheme
		vim.cmd.colorscheme("ayu")
	end,
}
