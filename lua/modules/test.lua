local lspkind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Key = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
	Array = "",
	Boolean = "蘒",
	Namespace = "",
	Number = "",
	Null = "ﳠ",
	Object = "",
	-- Package = "",
	Package = "",
	String = "",
}

require("cmp").setup({
	window = {
		completion = {
			winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
			zindex = 100,
			scrolloff = 3,
			-- col_offset = 100,
			side_padding = 0,
			scrollbar = true,
		},
	},

	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			-- kind.menu = "    (" .. (strings[2] or "") .. ")"
			kind.menu = "" .. (strings[2] or "") .. ""

			return kind
		end,
	},

	-- formatting = {
	-- 	format = function(entry, vim_item)
	-- 		local kind = require("lspkind").cmp_format({
	-- 			-- mode = "symbol_text",
	-- 			mode = "text_symbol",
	-- 			-- mode = "text",
	-- 			-- mode = "symbol",
	-- 			maxwidth = 30,
	-- 			symbol_map = lspkind_icons,
	-- 		})(entry, vim_item)
	-- 		return kind
	-- 	end,
	-- },
})

vim.api.nvim_set_hl(0, "Pmenu", {fg="#000000"})
