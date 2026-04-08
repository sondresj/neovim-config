return {
    cmd = { 'true' },
    settings = {
        Lua = {
            completion = {
                callSnippet = 'Replace',
            },
            diagnostics = { disable = { 'missing-fields' } },
        }
    }
}
