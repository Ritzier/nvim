local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

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

local cmp_window = require("cmp.utils.window")

function cmp_window:has_scrollbar()
	return false
end

local compare = require("cmp.config.compare")

local cmp = require("cmp")
cmp.setup({
	window = {
		completion = {
			border = border("CmpBorder"),
		},
		documentation = {
			border = border("CmpDocBorder"),
		},
	},
	sorting = {
		comparators = {
			-- require("cmp_tabnine.compare"),
			compare.offset,
			compare.exact,
			compare.score,
			require("cmp-under-comparator").under,
			compare.kind,
			compare.sort_text,
			compare.length,
			compare.order,
		},
	},
	formatting = {
		format = function(entry, vim_item)
			local lspkind_icons = require("modules.icons").nvim_lsp
			-- load lspkind icons
			vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)

			vim_item.menu = ({
				-- cmp_tabnine = "[TN]",
				buffer = "[BUF]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[LUA]",
				path = "[PATH]",
				luasnip = "[SNIP]",
			})[entry.source.name]

			return vim_item
		end,
	},
	-- You can set mappings if you want
	mapping = cmp.mapping.preset.insert({
		--[[ ["<CR>"] = cmp.mapping.confirm({ select = true }), ]]
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-h>"] = function(fallback)
			if require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
			else
				fallback()
			end
		end,
		["<C-l>"] = function(fallback)
			if require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
			else
				fallback()
			end
		end,
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	-- You should specify your *installed* sources.
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "latex_symbols" },
		-- { name = "cmp_tabnine" },
	},
})