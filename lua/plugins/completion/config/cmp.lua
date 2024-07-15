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

	local t = function(str)
		return vim.api.nvim_replace_termodes(str, true, true, true)
	end

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
	compare.lsp_scores = function(entry1, entry2)
		local diff
		if entry1.completion_item.score and entry2.completion_item.score then
			diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
		else
			diff = entry2.score - entry1.score
		end
		return (diff < 0)
	end

	cmp.setup({
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
				compare.offset,
				compare.exact,
				compare.lsp_scores,
				compare.sort_text,
				compare.score,
				require("cmp-under-comparator").under,
				compare.kind,
				compare.length,
				compare.order,
			},
		},

		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = function(entry, vim_item)
				local kind = require("lspkind").cmp_format({
					mod = "text_symbol",
					maxwidth = 30,
					symbol_map = kind_icons,
				})(entry, vim_item)

				local strings = vim.split(kind.kind, "%s", { trimempty = true })
				kind.kind = " " .. (strings[2] or "") .. ""
				kind.menu = "" .. (strings[1] or "") .. ""

				return kind
			end,
		},

		matching = {
			disallow_partial_fuzzy_matching = false,
		},

		preformance = {
			async_budget = 1,
			max_view_entries = 120,
		},

		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		sources = {
			{ name = "nvim_lsp", max_item_count = 300 },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "path" },
			-- { name = "treesitter" },
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
