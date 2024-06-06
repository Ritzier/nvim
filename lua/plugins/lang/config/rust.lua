return function()
	vim.g.rustaceanvim = {
		tools = {},
		-- LSP configuration
		server = {
			on_attach = require("keymaps.lsp").on_attach,
			default_settings = {
				["rust-analyzer"] = {
					["rustfmt.overrideCommand"] = { "leptosfmt", "--stdin", "--rustfmt" },
					cargo = {
						allFeatures = true,
						loadOutDirFromCheck = true,
						runBuildScripts = true,
					},
					checkOnSave = {
						allFeatures = true,
						command = "clippy",
						extraArgs = { "--no-deps" },
					},
					procMacro = {
						enable = true,
						ignored = {
							leptos_macro = {
								-- optional: --
								-- "component",
								"server",
							},
							["async-trait"] = {
								"async_trait",
							},
							["napi-derive"] = {
								"nap",
							},
							["async-resursion"] = {
								"async_recursion",
							},
						},
					},
				},
			},
		},
		-- Disable automatic DAP configuration to avoid conflicts with previous user configs
		dap = {
			adapter = false,
			configuration = false,
			autoload_configurations = false,
		},
	}
end
