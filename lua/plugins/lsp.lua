return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", },
                automatic_installation = {
                    exclude = { "lua_ls", "rust_analyzer", "tsserver", },
                }
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.rust_analyzer.setup({
                settings = {
                    ['rust-analyzer'] = {}
                }
            })
            lspconfig.tsserver.setup({})


            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local desc = function(s)
                        return { buffer = ev.buf, desc = s }
                    end
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, desc("Go to declaration"))
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, desc("Go to definition"))
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, desc("Hover"))
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, desc("Go to implementation"))
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, desc("Show signature help"))
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, desc("Type definition"))
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, desc("Rename identifier"))
                    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, desc("Show code actions"))
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, desc("Go to references"))
                    vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                    end, desc("Format buffer"))
                end,
            })
        end,
    }
}
