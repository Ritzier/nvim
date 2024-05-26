return function(on_attach, capabilities)
	require("neodev").setup({
		library = {
			enabled = true,
			runtime = true,
			types = true,
			plugins = true,
		},
		setup_jsonls = true,
		lspconfig = true,
		pathStrict = true,
	})

	require("lspconfig")["lua_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
					disable = { "different-requires" },
				},
				format = { enable = false },
				telemetry = { enable = false },
				-- Do not override treesitter lua highlighting with lua_ls's highlighting
				semantic = { enable = false },
			},
		},
	})
end
