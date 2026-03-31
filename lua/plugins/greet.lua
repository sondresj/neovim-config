local dashboard = require("alpha.themes.dashboard")
local logo = [[
                                             
      ████ ██████           █████      ██
     ███████████             █████ 
     █████████ ███████████████████ ███   ███████████
    █████████  ███    █████████████ █████ ██████████████
   █████████ ██████████ █████████ █████ █████ ████ █████
 ███████████ ███    ███ █████████ █████ █████ ████ █████
██████  █████████████████████ ████ █████ █████ ████ ██████
]]
dashboard.section.header.val = vim.split(logo, "\n")
dashboard.section.buttons.val = {
	dashboard.button("f", " " .. " Find file", ":FzfLua find_files <CR>"),
	dashboard.button("r", " " .. " Recent files", ":FzfLua oldfiles <CR>"),
	dashboard.button("g", " " .. " Find text", ":FzfLua live_grep_native <CR>"),
	-- TODO: The following requires a persistence module. Maybe a vim.opt?
	-- dashboard.button('s', ' ' .. ' Restore Session', [[:lua require('persistence').load() <cr>]]),
	-- dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
	dashboard.button("p", "󰚰" .. " Update plugins", ":lua vim.pack.update()<CR>"),
	dashboard.button("l", "󰚰" .. " Update lsp's", ":MasonUpdate<CR>"),
	dashboard.button("t", "󰚰" .. " Update treesitters", ":TSUpdate<CR>"),
	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.opts.layout[1].val = 6

require("alpha").setup(dashboard.opts)
