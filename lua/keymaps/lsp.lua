local a = {}
function a:on_attach(bufnr)
	local wk = require("which-key")
	wk.add({
		{
			mode = { "n" },
			{ "<space>w", group = "workspace" },
			{ "<space>wa", ":lua vim.lsp.buf.add_workspace_folder", desc = "Add Workspace Folder" },
			{ "<space>wr", ":lua vim.lsp.buf.remove_workspace_folder", desc = "Remove Workspace Folder" },
			{
				"<space>wl",
				function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end,
				desc = "List Workspace Folder",
			},
			{
				"<space>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				desc = "Format",
			},

			{ "<space>n", ":lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
			{ "<space>e", ":lua vim.diagnostic.open_float()<CR>", desc = "Diagnostic Open Float" },
			{ "gd", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
			{ "gD", "<cmd>Lspsaga goto_definition<CR>", desc = "Goto Definition" },
			{ "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Doc" },
			{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump prev Diagnostic" },
			{ "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Jump next Diagnostic" },
		},
	})
end

return a
