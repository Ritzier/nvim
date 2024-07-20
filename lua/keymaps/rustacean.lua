local a = {}
function a:on_attach(bufnr)
	local wk = require("which-key")
	wk.add({
		{
			mode = { "n" },
			-- { "<space>l", "", desc = "" },
			{ "<space>lt", ":RustTest!<CR>", desc = "Test All" },
			{ "<space>lR", ":RustAnalyzer Restart<CR>!", desc = "RustAnalyzer Restart" },
			{ "<space>m", ":RustLsp expandMacro<CR>", desc = "" },
			{ "<space>n", ":lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
			{ "<space>e", ":lua vim.diagnostic.open_float()<CR>", desc = "Diagnostic Open Float" },
		},
	})
end

return a
