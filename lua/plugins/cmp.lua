return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',

        -- Copilot
        "zbirenbaum/copilot.lua",
        "zbirenbaum/copilot-cmp",
        "AndreM222/copilot-lualine",
    },
    lazy = false,
    config = function()
        require("copilot").setup({
            -- use nvim-cmp panel instead
            suggestions = { enabled = false },
            panel = { enabled = false, }
        })
        require("copilot_cmp").setup({
            fix_pairs = true,
        })

        local cmp = require("cmp")
        cmp.setup({
            window = {
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "copilot" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
            }),
        })
    end,
}
