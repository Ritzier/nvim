return function(on_attach, capabilities)
	local rt = require("rust-tools")
	local opts = {
		tools = { -- rust-tools options
			executor = require("rust-tools/executors").termopen,
			on_initialized = nil,
			reload_workspace_from_cargo_toml = true,
			inlay_hints = {
				auto = true,
				only_current_line = false,
				show_parameter_hints = true,
				parameter_hints_prefix = "<- ",
				other_hints_prefix = "=> ",
				max_len_align = false,
				max_len_align_padding = 1,
				right_align = false,
				right_align_padding = 7,
				highlight = "Comment",
			},

			hover_actions = {
				border = {
					{ "╭", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╮", "FloatBorder" },
					{ "│", "FloatBorder" },
					{ "╯", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╰", "FloatBorder" },
					{ "│", "FloatBorder" },
				},

				auto_focus = false,
			},

			crate_graph = {
				backend = "x11",
				output = nil,
				full = true,
				autoSetHints = true,
				hover_with_actions = true,
				inlay_hints = {
					show_parameter_hints = true,
					parameter_hints_prefix = "",
					other_hints_prefix = "",
				},

				enabled_graphviz_backends = {
					"bmp",
					"cgimage",
					"canon",
					"dot",
					"gv",
					"xdot",
					"xdot1.2",
					"xdot1.4",
					"eps",
					"exr",
					"fig",
					"gd",
					"gd2",
					"gif",
					"gtk",
					"ico",
					"cmap",
					"ismap",
					"imap",
					"cmapx",
					"imap_np",
					"cmapx_np",
					"jpg",
					"jpeg",
					"jpe",
					"jp2",
					"json",
					"json0",
					"dot_json",
					"xdot_json",
					"pdf",
					"pic",
					"pct",
					"pict",
					"plain",
					"plain-ext",
					"png",
					"pov",
					"ps",
					"ps2",
					"psd",
					"sgi",
					"svg",
					"svgz",
					"tga",
					"tiff",
					"tif",
					"tk",
					"vml",
					"vmlz",
					"wbmp",
					"webp",
					"xlib",
					"x11",
				},
			},
		},

		server = {
			standalone = true,
			-- server = {
			-- 	capabilities = capabilities,
			-- 	-- on_attach = on_attach(_, bufnr),
			-- 	settings = {
			-- 		["rust-analyzer"] = {
			-- 			checkOnSave = {
			-- 				command = "clippy",
			-- 			},
			-- 			completion = {
			-- 				-- postfix = {
			-- 				--   enable = false,
			-- 				-- }
			-- 				callable = {
			-- 					snippets = "fill_arguments",
			-- 				},
			-- 			},
			-- 			imports = {
			-- 				granularity = {
			-- 					group = "module",
			-- 				},
			-- 				prefix = "self",
			-- 			},
			-- 			cargo = {
			-- 				buildScripts = {
			-- 					enable = true,
			-- 				},
			-- 			},
			-- 			procMacro = {
			-- 				enable = true,
			-- 			},
			-- 		},
			-- 	},
			-- },

			-- rust-analyer options
		},
		-- dap = {
		--   adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
		-- },
	}

	require("rust-tools").setup(opts)
	require("lspconfig")["rust_analyzer"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
				completion = {
					-- postfix = {
					--   enable = false,
					-- }
					callable = {
						snippets = "fill_arguments",
					},
				},
				imports = {
					granularity = {
						group = "module",
					},
					prefix = "self",
				},
				cargo = {
					buildScripts = {
						enable = true,
					},
				},
				procMacro = {
					enable = true,
				},
			},
		},
	})
	-- require("dap").defaults.fallback.terminal_win_cmd = "50vsplit new"
end
