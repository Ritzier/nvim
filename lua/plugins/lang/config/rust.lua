return function()
	vim.g.rustaceanvim = {
		tools = {},
		-- LSP configuration
		server = {
			on_attach = require("keymaps.lsp").on_attach,
			default_settings = {
				['rust-analyzer'] = {
					procMacro = {
						ignored = {
							leptos_macro = {
								-- optional: --
								-- "component",
								"server",
							},
						},
					},
				},
			}
		},
		-- Disable automatic DAP configuration to avoid conflicts with previous user configs
		dap = {
			adapter = false,
			configuration = false,
			autoload_configurations = false,
		},
	}
end
