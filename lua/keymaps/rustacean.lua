local a = {}
function a:on_attach(bufnr)
	local wk = require("which-key")
	wk.add({
		{
			mode = { "n" },
			{ "<space>d", group = "Doc View" },
			{ "<space>dt", "<cmd>DocsViewToggle<CR>", desc = "DocsViewToggle" },
			{ "<space>du", "<cmd>DocsViewUpdate<CR>", desc = "DocsViewUpdate" },
			{ "<space>l", group = "Lsp" },
			-- { "<space>l", "", desc = "" },
			{ "<space>lt", ":RustTest!<CR>", desc = "Test All" },
			{ "<space>lR", ":RustAnalyzer Restart<CR>!", desc = "RustAnalyzer Restart" },
			{ "<space>m", ":RustLsp expandMacro<CR>", desc = "Expand Macro" },
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
