require("garmin-monkeyc").setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	on_attach = my_on_attach,
	type_check_level = "Default", -- Default | Off | Gradual | Informative | Strict
	optimization_level = "Default", -- Default | None | Basic | Fast | Slow
	function_completion = "snippet", -- "snippet" (cursor inside ()) | "strip"
	sdk_path = "~/.local/lib/connectiq-sdk-manager-linux", -- SDK path, set if not in the OS default
	device = nil, -- device id for type-checking (leave blank unless needed)
	developer_key = "~/.garmin/developer_key.der",
})
