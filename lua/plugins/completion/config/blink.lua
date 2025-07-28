return function()
	require("blink.cmp").setup({
		cmdline = { enabled = false },

		completion = {
			menu = {
				auto_show = true,
				min_width = 15,
				max_height = 10,
				scrolloff = 2,
				scrollbar = true,

				border = "single",

				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind", gap = 1 },
					},

					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									icon = require("lspkind").symbolic(ctx.kind, {
										mode = "symbol",
									})
								end

								return icon .. ctx.icon_gap
							end,
						},
					},
				},
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 1,
				update_delay_ms = 50,
				window = { border = "rounded", min_width = 10, max_width = 80, max_height = 20, scrollbar = true },
			},

			trigger = {
				-- When true, will prefetch the completion items when entering insert mode
				prefetch_on_insert = true,

				-- When false, will not show the completion window automatically when in a snippet
				show_in_snippet = true,

				-- When true, will show completion window after backspacing
				show_on_backspace = true,

				-- When true, will show completion window after backspacing into a keyword
				show_on_backspace_in_keyword = false,

				-- When true, will show the completion window after accepting a completion and then backspacing into a keyword
				show_on_backspace_after_accept = true,

				-- When true, will show the completion window after entering insert mode and backspacing into keyword
				show_on_backspace_after_insert_enter = true,

				-- When true, will show the completion window after typing any of alphanumerics, `-` or `_`
				show_on_keyword = true,

				-- When true, will show the completion window after typing a trigger character
				show_on_trigger_character = true,

				-- When true, will show the completion window after entering insert mode
				show_on_insert = false,

				-- LSPs can indicate when to show the completion window via trigger characters
				-- however, some LSPs (i.e. tsserver) return characters that would essentially
				-- always show the window. We block these by default.
				show_on_blocked_trigger_characters = { " ", "\n", "\t" },
				-- You can also block per filetype with a function:
				-- show_on_blocked_trigger_characters = function(ctx)
				--   if vim.bo.filetype == 'markdown' then return { ' ', '\n', '\t', '.', '/', '(', '[' } end
				--   return { ' ', '\n', '\t' }
				-- end,

				-- When both this and show_on_trigger_character are true, will show the completion window
				-- when the cursor comes after a trigger character after accepting an item
				show_on_accept_on_trigger_character = true,

				-- When both this and show_on_trigger_character are true, will show the completion window
				-- when the cursor comes after a trigger character when entering insert mode
				show_on_insert_on_trigger_character = true,

				-- List of trigger characters (on top of `show_on_blocked_trigger_characters`) that won't trigger
				-- the completion window when the cursor comes after a trigger character when
				-- entering insert mode/accepting an item
				show_on_x_blocked_trigger_characters = { "'", '"', "(" },
				-- or a function, similar to show_on_blocked_trigger_character
			},

			accept = {
				-- Write completions to the `.` register
				dot_repeat = true,
				-- Create an undo point when accepting a completion item
				create_undo_point = true,
				-- How long to wait for the LSP to resolve the item with additional information before continuing as-is
				resolve_timeout_ms = 100,
				-- Experimental auto-brackets support
				auto_brackets = {
					-- Whether to auto-insert brackets for functions
					enabled = true,
					-- Default brackets to use for unknown languages
					default_brackets = { "(", ")" },
					-- Overrides the default blocked filetypes
					-- See: https://github.com/Saghen/blink.cmp/blob/main/lua/blink/cmp/completion/brackets/config.lua#L5-L9
					override_brackets_for_filetypes = {},
					-- Synchronously use the kind of the item to determine if brackets should be added
					kind_resolution = {
						enabled = true,
						blocked_filetypes = { "typescriptreact", "javascriptreact", "vue" },
					},
					-- Asynchronously use semantic token to determine if brackets should be added
					semantic_token_resolution = {
						enabled = true,
						blocked_filetypes = { "java" },
						-- How long to wait for semantic tokens to return before assuming no brackets should be added
						timeout_ms = 400,
					},
				},
			},
		},

		sources = {
			default = { "lsp", "path", "snippets" },
			providers = {
				path = {
					opts = {
						get_cwd = function(_)
							return vim.fn.getcwd()
						end,
					},
				},
			},
		},

		signature = { enabled = false, window = { border = "single" } },

		keymap = {
			preset = "none",

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev" },
			["<C-n>"] = { "select_next" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			-- Use `built-in` signature
			-- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },

			["<C-e>"] = { "show", "show_documentation", "hide_documentation" },

			["<A-CR>"] = { "accept", "fallback" },
		},
	})
end
