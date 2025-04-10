return function(opts)
	require("lspconfig").pylsp.setup({
		capabilities = opts.capabilities,
		on_attach = opts.on_attach,
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						ignore = { "W391" },
						maxLineLength = 120,
					},
				},
			},
		},
	})
end
