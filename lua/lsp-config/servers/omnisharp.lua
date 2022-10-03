local M = {}

function M.setup(on_attach, capabilities)
	require("lspconfig").omnisharp.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "dotnet", "" },
		enable_editorconfig_support = true,
		enable_ms_build_load_projects_on_demand = false,
		enable_roslyn_analyzers = true,
		organize_imports_on_format = true,
		enable_import_completion = true,
		sdk_include_prereleases = true,
		analyze_open_documents_only = false,
		use_mono = true,
	})
end

return M
