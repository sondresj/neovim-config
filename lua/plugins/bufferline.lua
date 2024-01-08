return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    version = "*",
    config = function()
        -- local highlights = require("nord").bufferline.highlights({
        --     italic = true,
        --     bold = true,
        -- })

        require("bufferline").setup({
            options = {
                separator_style = "thin",
            },
            -- highlights = highlights,
        })
    end,
}
