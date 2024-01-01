return {
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "rust", "json", "javascript", "typescript", "html", "css", "yaml", "tsx", "sql", "toml", "scss", "bash" },
                auto_install = true,
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>ss",
                        node_incremental = "<leader>si",
                        scope_incrementail = "<leader>sc",
                        node_decremental = "<leader>sd",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["as"] = "@scope",
                        },
                        selection_modes = {
                            ['@paramter.outer'] = 'v',
                            ['@function.outer'] = 'V',
                        },
                        include_surrounding_whitespace = true,
                    },
                    -- swap = {
                    --     enable = true,
                    --     swap_next = {
                    --         ["<leader>w"] = "@parameter.inner",
                    --     },
                    --     swap_previous = {
                    --         ["<leader>W"] = "@parameter.inner",
                    --     },
                    -- },
                },
            })
        end,
    },
}
