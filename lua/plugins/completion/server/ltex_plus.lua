return function(opts)
	require("lspconfig")["ltex_plus"].setup({
		capabilities = opts.capabilities,
		settings = {
			ltex = {
				-- Additional word that wouldn't count as spelling errors
				dictionary = {
					["en-US"] = { "enums", "url" },
				},
			},
		},
	})
end
