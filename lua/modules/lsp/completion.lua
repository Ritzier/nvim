vim.cmd([[
highlight! Pmenu guibg=#24273a guifg=#cad3f5
highlight! PmenuSel guibg=#4c4f69 guifg=NONE

" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
highlight! CmpItemMenu guibg=None guifg=#c599aa

" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]])

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_window = require("cmp.utils.window")

function cmp_window:has_scrollbar()
	return false
end

local compare = require("cmp.config.compare")

local lspkind = require('lspkind')

local kind_icons = require("modules.icons").nvim_lsp

local source_mapping = {
	npm = "   NPM",
	cmp_tabnine = "  ",
	nvim_lsp = "  LSP",
	buffer = " ﬘ BUF",
	nvim_lua = "  ",
	luasnip = "  SNP",
	calc = "  ",
	path = " ﱮ ",
	treesitter = "  ",
	zsh = "   ZSH",
}

local cmp = require("cmp")
cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	sorting = {
		comparators = {
			compare.offset,
			compare.exact,
			compare.locality,
			compare.score,
			require("cmp-under-comparator").under,
			compare.kind,
			compare.sort_text,
			compare.length,
			compare.order,
		},
	},
	formatting = {
		-- format = function(entry, vim_item)
		-- 	vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
		-- 	-- Source
		-- 	vim_item.menu = ({
		-- 		buffer = "[Buffer]",
		-- 		nvim_lsp = "[LSP]",
		-- 		luasnip = "[LuaSnip]",
		-- 		nvim_lua = "[Lua]",
		-- 		latex_symbols = "[LaTeX]",
		-- 	})[entry.source.name]
		-- 	return vim_item
		-- end

		format = function(entry, vim_item)
			vim_item.kind = lspkind.symbolic(vim_item.kind, { with_text = true })
			local menu = source_mapping[entry.source.name]
			local maxwidth = 50

			if entry.source.name == 'cmp_tabnine' then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = menu .. entry.completion_item.data.detail
				else
					menu = menu .. 'TBN'
				end
			end

			vim_item.menu = menu
			vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)

			return vim_item
		end
	},
	-- You can set mappings if you want
	mapping = cmp.mapping.preset.insert({
		--[[ ["<CR>"] = cmp.mapping.confirm({ select = true }), ]]
		["<A-CR>"] = cmp.mapping.confirm({ select = true }),
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
		{ name = "calc" },
		{ name = "cmp_tabnine" },
		{ name = "npm" }
	},
})
