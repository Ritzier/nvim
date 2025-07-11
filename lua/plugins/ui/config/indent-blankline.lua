return function()
	require("ibl").setup({
		enabled = true,
		debounce = 100,
		indent = {
			char = "│",
			tab_char = "│",
			smart_indent_cap = true,
			priority = 2,
		},
		whitespace = {
			remove_blankline_trail = true,
		},
		-- Note: The `scope` field requires treesitter to be set up
		scope = {
			enabled = true,
			char = "┊",
			show_start = false,
			show_end = false,
			show_exact_scope = true,
			injected_languages = true,
			priority = 1000,
			include = {
				-- Get the node type at current cursor:
				-- local ts_utils = require("nvim-treesitter.ts_utils")
				-- local node = ts_utils.get_node_at_cursor()
				--
				-- if node then
				--     local node_type = node:type()
				--     print("Node type: " .. node_type)
				-- end
				node_type = {
					["*"] = {
						"argument_list",
						"arguments",
						"assignment_statement",
						"Block",
						"class",
						"ContainerDecl",
						"dictionary",
						"do_block",
						"do_statement",
						"element",
						"except",
						"FnCallArguments",
						"for",
						"for_statement",
						"function",
						"function_declaration",
						"function_definition",
						"if_statement",
						"IfExpr",
						"IfStatement",
						"import",
						"InitList",
						"list_literal",
						"method",
						"object",
						"ParamDeclList",
						"repeat_statement",
						"selector",
						"SwitchExpr",
						"table",
						"table_constructor",
						"try",
						"tuple",
						"type",
						"var",
						"while",
						"while_statement",
						"with",

						-- Rust
						"tuple_expression",
						"macro",
						"macro_invocation",
						"delim_nodes",
						"element_node",
						"use_declaration",
						"let_declaration",
						"field_expression",
						"declaration_list",
					},
				},
			},
		},
		exclude = {
			filetypes = {
				"", -- for all buffers without a file type
				"aerial",
				"alpha",
				"big_file_disabled_ft",
				"dashboard",
				"dotooagenda",
				"flutterToolsOutline",
				"fugitive",
				"git",
				"gitcommit",
				"help",
				"json",
				"log",
				"markdown",
				"NvimTree",
				"peekaboo",
				"startify",
				"TelescopePrompt",
				"todoist",
				"txt",
				"undotree",
				"vimwiki",
				"vista",
			},
			buftypes = { "terminal", "nofile", "quickfix", "prompt" },
		},
	})
end
