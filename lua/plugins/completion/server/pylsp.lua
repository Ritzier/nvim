return function(opts)
	vim.lsp.config("pylsp", {
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
