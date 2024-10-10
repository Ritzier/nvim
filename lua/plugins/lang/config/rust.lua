return function()
	vim.g.rustaceanvim = {
		tools = {},
		-- LSP configuration
		server = {
			default_settings = {
				["rust-analyzer"] = {
					["rustfmt.overrideCommand"] = { "leptosfmt", "--stdin", "--rustfmt" },
					cargo = {
						allFeatures = true,
						loadOutDirFromCheck = true,
						runBuildScripts = true,
					},
					checkOnSave = {
						false,
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
					inlayHints = {
						bindingModeHints = {
							enable = false,
						},
						chainingHints = {
							enable = true,
						},
						closingBraceHints = {
							enable = true,
							minLines = 25,
						},
						closureReturnTypeHints = {
							enable = "never",
						},
						lifetimeElisionHints = {
							enable = "never",
							useParameterNames = false,
						},
						maxLength = 25,
						parameterHints = {
							enable = true,
						},
						reborrowHints = {
							enable = "never",
						},
						renderColons = true,
						typeHints = {
							enable = true,
							hideClosureInitialization = false,
							hideNamedConstructor = false,
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
