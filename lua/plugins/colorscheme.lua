return {
    "folke/tokyonight.nvim",
    priority = 1000, -- need to load before lualine and bufferline, default is 50, highest is loaded first
    lazy = false,
    config = function()

        require("tokyonight").setup({
            style = "night",
            transparent = true,
        })
        -- Load the colorscheme
        vim.cmd.colorscheme("tokyonight")
    end,
}
