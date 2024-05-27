return function(on_attach, capabilities)
	local opts = {
		tools = {
			executor = require("rust-tools.executors").termopen,

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

				max_width = nil,
				max_height = nil,

				-- whether the hover action window gets automatically focused
				-- default: false
				auto_focus = false,
			},

			-- settings for showing the crate graph based on graphviz and the dot
			-- command
			crate_graph = {
				-- Backend used for displaying the graph
				-- see: https://graphviz.org/docs/outputs/
				-- default: x11
				backend = "x11",
				-- where to store the output, nil for no output stored (relative
				-- path from pwd)
				-- default: nil
				output = nil,
				-- true for all crates.io and external crates, false only the local
				-- crates
				-- default: true
				full = true,

				-- List of backends found on: https://graphviz.org/docs/outputs/
				-- Is used for input validation and autocompletion
				-- Last updated: 2021-08-26
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
			standalone = false,
			capabilities = capabilities,
			on_attach = on_attach,
			experimental = {
				serverStatusNotification = true,
			},
			general = {
				positionEncodings = { "utf-16" },
			},
			textDocument = {
				callHierarchy = {
					dynamicRegistration = false,
				},
				codeAction = {
					codeActionLiteralSupport = {
						codeActionKind = {
							valueSet = {
								"",
								"quickfix",
								"refactor",
								"refactor.extract",
								"refactor.inline",
								"refactor.rewrite",
								"source",
								"source.organizeImports",
							},
						},
					},
					dataSupport = true,
					dynamicRegistration = true,
					isPreferredSupport = true,
					resolveSupport = {
						properties = { "edit" },
					},
				},
				completion = {
					completionItem = {
						commitCharactersSupport = false,
						deprecatedSupport = false,
						documentationFormat = { "markdown", "plaintext" },
						preselectSupport = false,
						snippetSupport = false,
					},
					completionItemKind = {
						valueSet = {
							1,
							2,
							3,
							4,
							5,
							6,
							7,
							8,
							9,
							10,
							11,
							12,
							13,
							14,
							15,
							16,
							17,
							18,
							19,
							20,
							21,
							22,
							23,
							24,
							25,
						},
					},
					contextSupport = false,
					dynamicRegistration = false,
				},
				declaration = {
					linkSupport = true,
				},
				definition = {
					dynamicRegistration = true,
					linkSupport = true,
				},
				diagnostic = {
					dynamicRegistration = false,
				},
				documentHighlight = {
					dynamicRegistration = false,
				},
				documentSymbol = {
					dynamicRegistration = false,
					hierarchicalDocumentSymbolSupport = true,
					symbolKind = {
						valueSet = {
							1,
							2,
							3,
							4,
							5,
							6,
							7,
							8,
							9,
							10,
							11,
							12,
							13,
							14,
							15,
							16,
							17,
							18,
							19,
							20,
							21,
							22,
							23,
							24,
							25,
							26,
						},
					},
				},
				formatting = {
					dynamicRegistration = true,
				},
				hover = {
					contentFormat = { "markdown", "plaintext" },
					dynamicRegistration = true,
				},
				implementation = {
					linkSupport = true,
				},
				inlayHint = {
					dynamicRegistration = true,
					resolveSupport = {
						properties = { "textEdits", "tooltip", "location", "command" },
					},
				},
				publishDiagnostics = {
					dataSupport = true,
					relatedInformation = true,
					tagSupport = {
						valueSet = { 1, 2 },
					},
				},
				rangeFormatting = {
					dynamicRegistration = true,
				},
				references = {
					dynamicRegistration = false,
				},
				rename = {
					dynamicRegistration = true,
					prepareSupport = true,
				},
				semanticTokens = {
					augmentsSyntaxTokens = true,
					dynamicRegistration = false,
					formats = { "relative" },
					multilineTokenSupport = false,
					overlappingTokenSupport = true,
					requests = {
						full = {
							delta = true,
						},
						range = false,
					},
					serverCancelSupport = false,
					tokenModifiers = {
						"declaration",
						"definition",
						"readonly",
						"static",
						"deprecated",
						"abstract",
						"async",
						"modification",
						"documentation",
						"defaultLibrary",
					},
					tokenTypes = {
						"namespace",
						"type",
						"class",
						"enum",
						"interface",
						"struct",
						"typeParameter",
						"parameter",
						"variable",
						"property",
						"enumMember",
						"event",
						"function",
						"method",
						"macro",
						"keyword",
						"modifier",
						"comment",
						"string",
						"number",
						"regexp",
						"operator",
						"decorator",
					},
				},
				signatureHelp = {
					dynamicRegistration = false,
					signatureInformation = {
						activeParameterSupport = true,
						documentationFormat = { "markdown", "plaintext" },
						parameterInformation = {
							labelOffsetSupport = true,
						},
					},
				},
				synchronization = {
					didSave = true,
					dynamicRegistration = false,
					willSave = true,
					willSaveWaitUntil = true,
				},
				typeDefinition = {
					linkSupport = true,
				},
			},
			window = {
				showDocument = {
					support = true,
				},
				showMessage = {
					messageActionItem = {
						additionalPropertiesSupport = false,
					},
				},
				workDoneProgress = true,
			},
			workspace = {
				applyEdit = true,
				configuration = true,
				didChangeConfiguration = {
					dynamicRegistration = false,
				},
				didChangeWatchedFiles = {
					dynamicRegistration = true,
					relativePatternSupport = true,
				},
				inlayHint = {
					refreshSupport = true,
				},
				semanticTokens = {
					refreshSupport = true,
				},
				symbol = {
					dynamicRegistration = false,
					symbolKind = {
						valueSet = {
							1,
							2,
							3,
							4,
							5,
							6,
							7,
							8,
							9,
							10,
							11,
							12,
							13,
							14,
							15,
							16,
							17,
							18,
							19,
							20,
							21,
							22,
							23,
							24,
							25,
							26,
						},
					},
				},
				workspaceEdit = {
					resourceOperations = { "rename", "create", "delete" },
				},
				workspaceFolders = true,
			},
		},

		-- debugging stuff
		dap = {
			adapter = {
				type = "executable",
				command = "lldb-vscode",
				name = "rt_lldb",
			},
		},
	}

	require("rust-tools").setup(opts)
end
