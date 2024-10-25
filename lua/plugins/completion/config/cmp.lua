return function()
	local cmp_mapping = require("cmp.config.mapping")

	local kind_icons = {
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
	}

	local cmp = require("cmp")

	local border = function(hl)
		return {
			{ "┌", hl },
			{ "─", hl },
			{ "┐", hl },
			{ "│", hl },
			{ "┘", hl },
			{ "─", hl },
			{ "└", hl },
			{ "│", hl },
		}
	end

	local compare = require("cmp.config.compare")
	local types = require("cmp.types")
	local kind_priority = {
		[types.lsp.CompletionItemKind.Field] = 1,
		[types.lsp.CompletionItemKind.Property] = 1,
		[types.lsp.CompletionItemKind.Variable] = 1,
		[types.lsp.CompletionItemKind.Method] = 2,
		[types.lsp.CompletionItemKind.Function] = 2,
		[types.lsp.CompletionItemKind.Constructor] = 2,
		[types.lsp.CompletionItemKind.Keyword] = 3,
		[types.lsp.CompletionItemKind.Class] = 3,
		[types.lsp.CompletionItemKind.Interface] = 3,
		[types.lsp.CompletionItemKind.Module] = 4,
		[types.lsp.CompletionItemKind.Snippet] = 5,
	}

	-- Custom comparator function
	-- INFO: weird problem, sometime would popup something useless
	-- local kind_comparator = function(entry1, entry2)
	-- 	local kind1 = entry1:get_kind()
	-- 	local kind2 = entry2:get_kind()
	-- 	local priority1 = kind_priority[kind1] or 100
	-- 	local priority2 = kind_priority[kind2] or 100
	-- 	return priority1 < priority2
	-- end

	require("cmp").setup({
		preselect = cmp.PreselectMode.Item,

		window = {
			completion = {
				border = border("PmenuBorder"),
				winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:PmenuSel",
				scrollbar = true,
			},
			documentation = {
				border = border("CmpDocBorder"),
				winhighlight = "Normal:CmpDoc",
				scrollbar = true,
			},
		},

		sorting = {
			priority_weight = 2,
			comparators = {
				-- kind_comparator,
				compare.offset,
				compare.exact,
				compare.sort_text,
				compare.score,
				compare.kind,
				compare.length,
				compare.order,
			},
		},

		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = function(entry, vim_item)
				local kind = require("lspkind").cmp_format({
					maxwidth = 45,
					symbol_map = kind_icons,
				})(entry, vim_item)
				local strings = vim.split(kind.kind, "%s", { trimempty = true })
				kind.kind = " " .. (strings[2] or "") .. ""
				kind.menu = "" .. (strings[1] or "") .. ""

				return kind
			end,
		},

		matching = {
			disallow_fuzzy_matching = true, -- Disallow fuzzy matching
			disallow_partial_fuzzy_matching = true, -- Disallow partial fuzzy matching
			disallow_partial_matching = true, -- Disallow partial matching
			disallow_prefix_unmatching = false, -- Allow prefix unmatching (e.g., match only when prefix matches)
		},

		preformance = {
			async_budget = 1,
		},

		sources = {
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "crates" },
		},

		mapping = cmp.mapping.preset.insert({
			["<C-p>"] = cmp_mapping(cmp_mapping.select_prev_item(), { "i", "c" }),
			["<C-n>"] = cmp_mapping(cmp_mapping.select_next_item(), { "i", "c" }),
			["<C-d>"] = cmp_mapping.scroll_docs(-4),
			["<C-f>"] = cmp_mapping.scroll_docs(4),
			["<C-w>"] = cmp_mapping.close(),
			["<Tab>"] = vim.NIL,
			["<S-Tab>"] = vim.NIL,
			["<A-CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
		}),
	})
end
