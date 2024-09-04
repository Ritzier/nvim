return function()
	require("conform").setup({
		formatters_by_ft = {
			css = { "prettier" },
			html = { "prettier" },
			javascript = { "prettier" },
			lua = { "stylua" },
			-- markdown = { "prettier", "markdownlint-cli2", "markdown-toc" },
			markdown = { "prettier" },
			proto = { "clang-format" },
			python = { "isort", "black" },
			rust = { "rustfmt", "leptosfmt" },
			toml = { "taplo" },
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
		notify_on_error = false,
	})

	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end
