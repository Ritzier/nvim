return function()
	local border = function(hl)
		return {
			{ "╭", hl },
			{ "─", hl },
			{ "╮", hl },
			{ "│", hl },
			{ "╯", hl },
			{ "─", hl },
			{ "╰", hl },
			{ "│", hl },
		}
	end

	local border2 = function(hl)
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

	local preselect = function(entry1, entry2)
		local preselect1 = entry1.completion_item.preselect or false
		local preselect2 = entry2.completion_item.preselect or false
		if preselect1 ~= preselect2 then
			return preselect1
		end
	end

	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local cmp = require("cmp")
	local compare = require("cmp.config.compare")

	require("cmp").setup({
		window = {
			completion = {
				border = border("CmpBorder"),
				winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
				-- col_offset = -3,
				-- side_padding = 0,
			},
			documentation = {
				border = border2("CmpDocBorder"),
			},
		},

		sources = require("cmp").config.sources({
			-- { name = "copilot" },
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "crates" },
			{ name = "treesitter" },
		-- }, {
			{ name = "path" },
			{ name = "buffer" },
			-- { name = "latex_symbols" },
		}),
		sorting = {
			priority_weight = 2,
			comparators = {
				-- require("copilot_cmp.comparators").prioritize,
				-- require("copilot_cmp.comparators").score,
				-- require("cmp_tabnine.compare"),
				compare.offset,
				compare.exact,
				compare.score,
				require("cmp-under-comparator").under,
				compare.kind,
				compare.sort_text,
				compare.length,
				compare.order,
				preselect,
			},
		},

		{
			format = function(entry, vim_item)
				local ELLIPSIS_CHAR = "…"
				local MAX_LABEL_WIDTH = 30
				local MAX_KIND_WIDTH = 20

				local get_ws = function(max, len)
					return (" "):rep(max - len)
				end

				vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)
				-- vim_item.kind = string.format("%s", lspkind_icons[vim_item.kind])

				-- vim_item.menu = ({
				--   npm = "   NPM",
				--   nvim_lsp = "  LSP",
				--   buffer = " ﬘ BUF",
				--   nvim_lua = " ",
				--   luasnip = "  SNP",
				--   calc = "  ",
				--   path = " ﱮ ",
				--   treesitter = " ",
				--   zsh = "   ZSH",
				--   Copilot = "",
				--   Copilot_alt = "",
				--   spell = "暈",
				-- })[entry.source.name]

				local content = vim_item.abbr
				if #content > MAX_LABEL_WIDTH then
					vim_item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
				else
					vim_item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
				end

				return vim_item
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<A-CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-f>"] = cmp.mapping.scroll_docs(-3),
			["<C-d>"] = cmp.mapping.scroll_docs(3),
			["<C-e>"] = cmp.mapping.close(),
			["<C-a>"] = cmp.mapping.complete(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif require("luasnip").expand_or_jumpable() then
					vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif require("luasnip").jumpable(-1) then
					vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
	})
end
