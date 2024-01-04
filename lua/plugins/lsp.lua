local servers = { "lua_ls", "rust_analyzer", "tsserver", "eslint", "csharp_ls" }
return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = servers,
                automatic_installation = {
                    exclude = servers,
                }
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities,
                }
            end

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local desc = function(s)
                        return { buffer = ev.buf, desc = s }
                    end
                    vim.keymap.set('n', "<leader>e", vim.diagnostic.open_float, desc("Open diagnostics"))
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
