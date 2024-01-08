return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        --'L3MON4D3/LuaSnip',
        --'saadparwaiz1/cmp_luasnip',

        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lua',

        -- Copilot
        "zbirenbaum/copilot.lua",
        "zbirenbaum/copilot-cmp",
        "AndreM222/copilot-lualine",

        -- Icons for suggestions source
        "onsails/lspkind.nvim",
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

        local lspkind = require("lspkind")
        local cmp = require("cmp")
        cmp.setup({
            window = {
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered(),
            },
            -- snippet = {
            --     expand = function(args)
            --         require("luasnip").lsp_expand(args.body)
            --     end,
            -- },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({}),
            }),
            sources = cmp.config.sources({
                { name = "copilot" },
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "nvim_lua" },
                { name = "luasnip" },
                { name = "path" },
            }, {
                { name = "buffer" },
            }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    before = function(_entry, vim_item)
                        return vim_item
                    end,
                }),
            },
        })
    end,
}
