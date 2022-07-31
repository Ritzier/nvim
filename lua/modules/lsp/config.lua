local navic = require("nvim-navic")
local gps = require("nvim-gps")

local config = {}

function config.lightbulb()
	vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
end

function config.luasnip()
	require("luasnip").config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
	})
	require("luasnip.loaders.from_lua").lazy_load()
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_snipmate").lazy_load()
end

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
	require("aerial").on_attach(client)

	-- if
	-- 	client.name ~= "efm"
	-- 	and client.name ~= "tailwindcss"
	-- 	and client.name ~= "angularls"
	-- 	and client.name ~= "html"
	-- 	and client.name ~= "bashls"
	-- then
	-- 	navic.attach(client, bufnr)
	-- 	require("lualine").setup({
	-- 		sections = {
	-- 			lualine_c = {
	-- 				{ navic.get_location, cond = navic.is_available },
	-- 			},
	-- 		},
	-- 	})
	-- else
	-- 	require("lualine").setup({
	-- 		sections = {
	-- 			lualine_c = {
	-- 				{ gps.get_location, cond = gps.is_available },
	-- 			},
	-- 		},
	-- 	})
	-- end

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
		require("lualine").setup({
			sections = {
				lualine_c = {
					{ navic.get_location, cond = navic.is_available },
				},
			},
		})
	else
		require("lualine").setup({
			sections = {
				lualine_c = {
					{ gps.get_location, cond = gps.is_available },
				},
			},
		})
	end
end

-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

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
			require("clangd_extensions.cmp_scores"),
			require("cmp-under-comparator").under,
			compare.kind,
			compare.sort_text,
			compare.length,
			compare.order,
		},
	},
	formatting = {
		format = function(entry, vim_item)
			local lspkind_icons = {
				Text = "",
				Method = "",
				Function = "",
				Constructor = "",
				Field = "ﰠ",
				Variable = "",
				Class = "ﴯ",
				Interface = "",
				Module = "",
				Property = "ﰠ",
				Unit = "塞",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			}
			-- load lspkind icons
			vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)

			vim_item.menu = ({
				-- cmp_tabnine = "[TN]",
				buffer = "[BUF]",
				orgmode = "[ORG]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[LUA]",
				path = "[PATH]",
				tmux = "[TMUX]",
				luasnip = "[SNIP]",
				spell = "[SPELL]",
			})[entry.source.name]

			return vim_item
		end,
	},
	-- You can set mappings if you want
	mapping = cmp.mapping.preset.insert({
		["4"] = cmp.mapping.confirm({ select = true }),
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
		{ name = "spell" },
		{ name = "tmux" },
		{ name = "orgmode" },
		{ name = "buffer" },
		{ name = "latex_symbols" },
		-- { name = "cmp_tabnine" },
	},
})

local function cmp_cmdline()
	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		source = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({ { name = "path" }, { name = "cmdline" } }),
	})
end

-- require("lspsaga").init_lsp_saga({
-- 	error_sign = "",
-- 	warn_sign = "",
-- 	hint_sign = "",
-- 	infor_sign = "",
-- })

require("nvim-lsp-installer").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
	"angularls",
	"bashls",
	"clangd",
	"clangd",
	"gopls",
	"html",
	"jdtls",
	"jsonls",
	"julials",
	"pyright",
	"rust_analyzer",
	"sourcekit",
	"sumneko_lua",
	"tailwindcss",
	"tsserver",
}

for _, server in ipairs(servers) do
	if server == "sumneko_lua" then
		local luadev = require("lua-dev").setup({
			library = {
				vimruntime = true,
				types = true,
				plugins = { "lua-dev.nvim", "plenary.nvim" },
			},
			lspconfig = {
				on_attach = on_attach,
				debounce_text_changes = 150,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workpsace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
							},
							maxPreload = 100000,
							preloadFileSize = 10000,
						},
					},
				},
			},
		})
		require("lspconfig")[server].setup(luadev)
	elseif server == "clangd" then
		require("clangd_extensions").setup({
			server = {
				on_attach = on_attach,
				debounce_text_changes = 150,
				capabilities = capabilities,
			},
		})
	elseif server == "jsonls" then
		require("lspconfig")[server].setup({
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					valdate = { enable = true },
				},
			},
			on_attach = on_attach,
			debounce_text_changes = 150,
			capabilities = capabilities,
		})
	elseif server == "clangd" then
		require("clangd_extensions").setup({
			server = {
				require("lspconfig")[server].setup({

					on_attach = on_attach,
					debounce_text_changes = 150,
					capabilities = capabilities,
				}),
			},
			extensions = {
				-- defaults:
				-- Automatically set inlay hints (type hints)
				autoSetHints = true,
				-- These apply to the default ClangdSetInlayHints command
				inlay_hints = {
					-- Only show inlay hints for the current line
					only_current_line = false,
					-- Event which triggers a refersh of the inlay hints.
					-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
					-- not that this may cause  higher CPU usage.
					-- This option is only respected when only_current_line and
					-- autoSetHints both are true.
					only_current_line_autocmd = "CursorHold",
					-- whether to show parameter hints with the inlay hints or not
					show_parameter_hints = true,
					-- prefix for parameter hints
					parameter_hints_prefix = "<- ",
					-- prefix for all the other hints (type, chaining)
					other_hints_prefix = "=> ",
					-- whether to align to the length of the longest line in the file
					max_len_align = false,
					-- padding from the left if max_len_align is true
					max_len_align_padding = 1,
					-- whether to align to the extreme right or not
					right_align = false,
					-- padding from the right if right_align is true
					right_align_padding = 7,
					-- The color of the hints
					highlight = "Comment",
					-- The highlight group priority for extmark
					priority = 100,
				},
				ast = {
					role_icons = {
						type = "",
						declaration = "",
						expression = "",
						specifier = "",
						statement = "",
						["template argument"] = "",
					},

					kind_icons = {
						Compound = "",
						Recovery = "",
						TranslationUnit = "",
						PackExpansion = "",
						TemplateTypeParm = "",
						TemplateTemplateParm = "",
						TemplateParamObject = "",
					},

					highlights = {
						detail = "Comment",
					},
				},
				memory_usage = {
					border = "none",
				},
				symbol_info = {
					border = "none",
				},
			},
		})
	elseif server == "html" then
		local capabilities1 = vim.lsp.protocol.make_client_capabilities()
		capabilities1.textDocument.completion.completionItem.snippetSupport = true
		require("lspconfig")[server].setup({
			single_file_support = true,
			on_attach = on_attach,
			debounce_text_changes = 150,
			capabilities = capabilities1,
		})
	elseif server == "rust_analyzer" then
		require("lspconfig")[server].setup({
			settings = {
				["rust-analyzer"] = {
					cargo = { allFeatures = true },
					checkOnSave = {
						command = "clippy",
						extraArgs = { "--no-deps" },
					},
				},
			},
			single_file_support = true,
			on_attach = on_attach,
			debounce_text_changes = 150,
			capabilities = capabilities,
		})
	else
		require("lspconfig")[server].setup({
			single_file_support = true,
			on_attach = on_attach,
			debounce_text_changes = 150,
			capabilities = capabilities,
		})
	end
end

local efmls = require("efmls-configs")

efmls.init({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = { documentFormatting = true, codeAction = true },
})

require("modules.lsp.efm")
require("modules.lsp.format").configure_format_on_save()

return config
