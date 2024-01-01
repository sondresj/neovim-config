return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("lualine").setup({
            options = {
                theme = "nord"
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff',
                    {
                        'diagnostics',
                        sources = { "nvim_diagnostic" },
                    }
                },
                --lualine_c = { 'filename' },
                lualine_x = { 'copilot', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        })
    end,
}
