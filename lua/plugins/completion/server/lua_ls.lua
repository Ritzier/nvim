return function(opts)
	vim.lsp.config("lua_ls", {
		capabilities = opts.capabilities,
		on_attach = opts.on_attach,
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = {
						"lua/?.lua",
						"lua/?/init.lua",
					},
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
					},
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})
end
