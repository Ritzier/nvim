return function(on_attach, capabilities)
	require("lspconfig").lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
            pythonPath = vim.fn.expand("python3")
		},
	})
end
