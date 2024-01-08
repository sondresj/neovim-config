local servers = { "lua_ls", "rust_analyzer", "tsserver", "eslint", "csharp_ls", "omnisharp" }
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
        opts = {
            ensure_installed = servers,
            automatic_installation = {
                exclude = servers,
            }
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'simrat39/rust-tools.nvim',
            'Decodetalkers/csharpls-extended-lsp.nvim',
        },
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            -- set defaults for all servers
            for _, server in ipairs(servers) do
                lspconfig[server].setup {
                    capabilities = capabilities,
                }
            end

            require("rust-tools").setup({
                server = {
                    capabilities = capabilities,
                }
            })

            local pid = vim.fn.getpid()
            local csharp_ls_bin = vim.fn.expand("$HOME") .. "/.dotnet/tools/csharp-ls.exe"
            local omnisharp_dll = vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll"

            if vim.fn.has("macunix") then
                csharp_ls_bin = vim.fn.expand("$HOME") .. "/.dotnet/tools/csharp-ls"
            end

            -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#omnisharp
            lspconfig.omnisharp.setup({
                capabilities = capabilities,
                handlers = {
                    ["textDocument/definition"] = require("csharpls_extended").handler,
                    ["textDocument/typeDefinition"] = require("csharpls_extended").handler,
                },
                cmd = { "dotnet", omnisharp_dll },
                enable_editorconfig_support = true,
                enable_ms_build_load_projects_on_demand = false,
                enable_roslyn_analyzers = true,
                organize_imports_on_format = true,
                enable_import_completion = true,
                sdk_include_prereleases = false,
                analyze_open_documents_only = false,
            })

            -- https://github.com/Decodetalkers/csharpls-extended-lsp.nvim
            lspconfig.csharp_ls.setup({
                capabilities = capabilities,
                handlers = {
                    ["textDocument/definition"] = require("csharpls_extended").handler,
                    ["textDocument/typeDefinition"] = require("csharpls_extended").handler,
                },
                cmd = { csharp_ls_bin, '--languageserver', '--hostPID', tostring(pid) }
            })


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
                    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, desc("Type definition"))
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, desc("Rename identifier"))
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, desc("Show code actions"))
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, desc("Go to references"))
                    vim.keymap.set('n', '<leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, desc("Format buffer"))
                end,
            })
        end,
    }
}
