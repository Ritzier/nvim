local M = {}

function M.setup(on_attach, capabilities)
	require("lspconfig")["gopls"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 500,
		},
		cmd = { "gopls", "-remote=auto" },
		settings = {
			gopls = {
				usePlaceholders = true,
				analyses = {
					nilness = true,
					shadow = true,
					unusedparams = true,
					unusewrites = true,
				},
			},
		},
	})
end

return M
