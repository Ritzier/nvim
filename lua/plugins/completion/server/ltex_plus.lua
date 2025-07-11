return function(opts)
	vim.lsp.config("ltex_plus", {
		capabilities = opts.capabilities,
		settings = {
			ltex = {
				-- Additional word that wouldn't count as spelling errors
				dictionary = {
					["en-US"] = { "enums", "url", "LTO", "Leptos" },
				},
			},
		},
	})
end
