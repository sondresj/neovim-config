return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls") -- null-ls is deprecated, none-ls is the new community maintained fork. It still exports null-ls tho
        null_ls.setup({
            -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
            sources = {
                -- null_ls.builtins.diagnostics.luacheck,
                -- null_ls.builtins.formatting.lua_format,
                -- null_ls.builtins.formatting.stylelua,

                null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.formatting.markdownlint,

                null_ls.builtins.diagnostics.shellcheck,
                null_ls.builtins.formatting.shellharden,
                null_ls.builtins.formatting.shfmt,

                null_ls.builtins.diagnostics.markuplint,
                null_ls.builtins.diagnostics.stylelint,
                null_ls.builtins.formatting.stylelint,
                null_ls.builtins.diagnostics.tsc,
                null_ls.builtins.code_actions.eslint_d,
                null_ls.builtins.formatting.eslint_d,

                null_ls.builtins.formatting.rustfmt,
            }
        })
    end,
}
