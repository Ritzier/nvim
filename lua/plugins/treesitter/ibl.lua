return function()
	require("ibl").setup({
		indent = {
			-- char = "┊",
			-- highlight = 'IblIndent', -- configured in theme.lua
			highlight = { "Function", "Label" },
			smart_indent_cap = true,
            priority = 100
		},
		-- whitespace = {},
		scope = {
			enabled = true,
			show_start = true,
			show_end = true,
			-- highlight = 'IblScope', -- configured in theme.lua
			priority = 500,
		},
		exclude = {
			filetypes = {
				"dashboard",
				"help",
				"startify",
				"aerial",
				"alpha",
				"dashboard",
				"packer",
				"neogitstatus",
				"NvimTree",
				"neo-tree",
				"Trouble",
			},


			buftypes = {
				"nofile",
				"terminal",
			},
		},
	})

	local hooks = require("ibl.hooks")
	hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end
