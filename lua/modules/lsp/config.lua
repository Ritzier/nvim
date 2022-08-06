local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "<leader>llc", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>llD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "<leader>lld", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "<leader>llf", vim.lsp.buf.formatting, bufopts)
	vim.keymap.set("n", "<leader>llh", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>lli", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader>lls", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>lln", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>llr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>llt", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>llwa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>llwr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>llwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)

	vim.keymap.set("n", "<leader>ltt", "<cmd>TroubleToggle<cr>", bufopts)
	vim.keymap.set("n", "<leader>ltq", "<cmd>TroubleToggle<cr> quickfix<cr>", bufopts)
	vim.keymap.set("n", "<leader>ltr", "<cmd>TroubleToggle<cr> lsp_references<cr>", bufopts)
	vim.keymap.set("n", "<leader>ltl", "<cmd>TroubleToggle<cr> loclist<cr>", bufopts)

	vim.keymap.set("n", "<leader>lgd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", bufopts)
	vim.keymap.set("n", "<leader>lgt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", bufopts)
	vim.keymap.set("n", "<leader>lgi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", bufopts)
	vim.keymap.set("n", "<leader>lgc", "<cmd>lua require('goto-preview').close_all_win()<CR>", bufopts)
	vim.keymap.set("n", "<leader>lgr", "<cmd>lua require('goto-preview').goto_preview_reference", bufopts)

	vim.keymap.set("n", "<leader>lsr", "<cmd>Lspsaga rename<cr>", bufopts)
	vim.keymap.set("n", "<leader>lsc", "<cmd>Lspsaga code_action<cr>", bufopts)
	vim.keymap.set("x", "<leader>lsc", ":<c-u>Lspsaga range_code_action<cr>", bufopts)
	vim.keymap.set("n", "<leader>lsk", "<cmd>Lspsaga hover_doc<cr>", bufopts)
	vim.keymap.set("n", "<leader>lss", "<cmd>Lspsaga show_line_diagnostics<cr>", bufopts)
	vim.keymap.set("n", "<leader>lsn", "<cmd>Lspsaga diagnostic_jump_next<cr>", bufopts)
	vim.keymap.set("n", "<leader>lsp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", bufopts)
	-- vim.keymap.set("n", "", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
	-- vim.keymap.set("n", "", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})

	require("lsp_signature").on_attach(client, bufnr)
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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
						runtime = {
							version = "LuaJIT",
							path = vim.split(package.path, ";"),
						},
					},
				},
				on_attach = on_attach,
				capabilities = capabilities,
			},
		})
		require("lspconfig")[server].setup(luadev)
	elseif server == "clangd" then
		require("clangd_extensions").setup({
			server = {
				on_attach = on_attach,
				capabilities = capabilities,
			},
			extensions = {
				autoSetHints = true,
				inlay_hints = {
					only_current_line = false,
					only_current_line_autocmd = "CursorHold",
					show_parameter_hints = true,
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
	elseif server == "jsonls" then
		require("lspconfig")[server].setup({
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					valdate = { enable = true },
				},
			},
			on_attach = on_attach,
			capabilities = capabilities,
		})
	elseif server == "html" then
	else
		require("lspconfig")[server].setup({
			on_attach = on_attach,
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
