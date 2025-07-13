return function(opts)
	vim.lsp.config("lua_ls", {
		capabilities = opts.capabilities,
		on_attach = opts.on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				runtime = {
					version = "LuaJIT",
					path = {
						"lua/?.lua",
						"lua/?/init.lua",
					},
				},
				workspace = {
					library = {
						vim.env.VIMRUNTIME,
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
					},
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
				hint = { enable = true, setType = true },
				format = { enable = false },
				telemetry = { enable = false },
				-- Do not override treesitter lua highlighting with lua_ls's highlighting
				semantic = { enable = false },
			},
		},
	})
end
