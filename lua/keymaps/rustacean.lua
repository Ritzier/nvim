local wk = require("which-key")
return function(client, bufnr)
	require("lsp_signature").on_attach({
		bind = true,
		handler_opts = {
			border = "rounded",
		},
	}, bufnr)

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr")

	if client.server_capabilities.definitionProvider then
		vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
	end

	wk.register({
        ["<C-a>"] = { ":RustLsp hover actions<CR>", "Hover Actions" },
		["<space>w"] = {
			name = "Workspace",
			a = { ":lua vim.lsp.buf.add_workspace_folder", "Add WorkSpace Folder" },
			r = { ":lua vim.lsp.buf.remove_workspace_folder", "Remove WorkSpace Folder" },
			l = {
				function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end,
				"List Workspace Folder",
			},
		},
		["<space>f"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"Format",
		},
		["<space>n"] = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
		["<space>e"] = { ":lua vim.diagnostic.open_float()<CR>", "Diagnostic Open Float" },
		["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
		["gD"] = { "<cmd>Lspsaga goto_definition<CR>", "Goto Definition" },
		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Hover Doc" },
		["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Jump prev Diagnostic" },
		["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Jump next Diagnostic" },
		["<space>l"] = {
			name = "Lspsaga",
			c = {
				name = "Calls",
				i = { "<cmd>Lspsaga incoming_calls<CR>", "Incoming Calls" },
				o = { "<cmd>Lspsaga outgoing_calls<CR>", "Outgoing Calls" },
			},
            t = { ":RustLsp testables<CR>", "Tests" },
			o = { "<cmd>Lspsaga outline<CR>", "Outline" },
			l = { "<cmd>Lspsaga show_line_diagnsotics<CR>", "Show Line Diagnostic" },
			f = { "<cmd>Lspsaga lsp_finder<CR>", "Finder" },
			R = { ":Rust", "Restart" },
		},
		["<space>a"] = {
			function()
				vim.cmd.RustLsp("codeAction")
			end,
			"Code Action",
		},
	}, { mode = "n", prefix = "", { silent = true, noremap = true } })
end
