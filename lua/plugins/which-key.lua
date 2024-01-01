return {
    "folke/which-key.nvim",
    opts = { },
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
}
