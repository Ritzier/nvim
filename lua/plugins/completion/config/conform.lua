return function()
	require("conform").setup({
		formatters_by_ft = {
			javascript = { { "prettierd", "prettier" } },
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "leptosfmt" },
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
	})

	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end
