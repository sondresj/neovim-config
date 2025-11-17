return {
	"nvim-mini/mini.completion",
	enabled = false,
	version = false,
	dependencies = {
		{ "nvim-mini/mini.icons", opts = {} },
		{
			"nvim-mini/mini.snippets",
			setup = function()
				local gen_loader = require("mini.snippets").gen_loader
				gen_loader.from_lang()
			end,
		},
	},
	opts = {
		window = {
			info = { height = 30, width = 80, border = "rounded" },
			signature = { height = 30, width = 80, border = "rounded" },
		},
	},
	-- TODO: Consider using blink.nvim instead
}
