return function()
	-- setup() is also available as an alias
	require("lspkind").init({
		-- default symbol map
		-- can be either 'default' (requires nerd-fonts font) or
		-- 'codicons' for codicon preset (requires vscode-codicons font)
		--
		-- default: 'default'
		preset = "codicons",

		-- override preset symbols
		--
		-- default: {}
		symbol_map = {
			Class = "󰠱",
			Color = "󰏘",
			Constant = "󰏿",
			Constructor = "",
			Enum = "",
			EnumMember = "",
			Event = "",
			Field = "󰇽",
			File = "󰈙",
			Folder = "󰉋",
			Function = "󰊕",
			Interface = "",
			Keyword = "󰌋",
			Method = "󰆧",
			Module = "",
			Namespace = "󰌗",
			Number = "",
			Operator = "󰆕",
			Package = "",
			Property = "󰜢",
			Reference = "",
			Snippet = "",
			Struct = "",
			Text = "󰉿",
			TypeParameter = "󰅲",
			Undefined = "",
			Unit = "",
			Value = "󰎠",
			Variable = "",
			-- ccls-specific icons.
			TypeAlias = "",
			Parameter = "",
			StaticMethod = "",
			Macro = "",
			-- Crates
			Feature = "",
			Version = "󰎠",
		},
	})
end
