return function()
	require("conform").setup({
		formatters_by_ft = {
			javascript = { { "prettierd", "prettier" } },
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "rustfmt", "leptosfmt" },
			toml = { "taplo" },
			proto = { "clang-format" },
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
		notify_on_error = false,
	})

	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end
