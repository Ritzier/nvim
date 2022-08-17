local M = {}

local function attach(client, bufnr)
	local opts = { noremap = true, silent = true }
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	local navic = require("nvim-navic")
	local gps = require("nvim-gps")
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	--[[ vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) ]]
	vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition<CR>", bufopts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)

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

	require("lsp_signature").on_attach({
		bind = true,
		use_lspsaga = false,
		floating_window = true,
		fix_pos = true,
		hint_enable = true,
		hi_parameter = "Search",
		handler_opts = { "double" },
	})

	if
		client.name ~= "tailwindcss"
		and client.name ~= "bashls"
		and client.name ~= "html"
		and client.name ~= "angularls"
		and client.name ~= "efm"
		and client.name ~= "cssls"
	then
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
	if client.server_capabilities.colorProvider then
		-- Attach document colour support
		require("document-color").buf_attach(bufnr)
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

function M.setup(servers)
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
					on_attach = attach,
					capabilities = capabilities,
				},
			})
			require("lspconfig")[server].setup(luadev)
		elseif server == "html" or server == "cssls" or server == "dartls" then
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.colorProvider = true
			require("lspconfig")[server].setup({
				on_attach = attach,
				capabilities = capabilities,
			})
		elseif server == "jsonls" then
			require("lspconfig")[server].setup({
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						valdate = { enable = true },
					},
				},
				on_attach = attach,
				capabilities = capabilities,
			})
		else
			require("lspconfig")[server].setup({
				capabilities = capabilities,
				on_attach = attach,
			})
		end
	end

	require("efmls-configs").init({
		on_attach = attach,
		capabilities = capabilities,
		init_options = { documentFormatting = true, codeAction = true },
	})
end

return M
