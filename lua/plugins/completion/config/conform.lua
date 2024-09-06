return function()
	require("conform").setup({
		formatters_by_ft = {
			-- markdown = { "prettier", "markdownlint-cli2", "markdown-toc" },
			css = { "prettier" },
			html = { "prettier" },
			javascript = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			proto = { "clang-format" },
			python = { "isort", "black" },
			rust = { "rustfmt", "leptosfmt" },
			toml = { "taplo" },
			yaml = { "yamlfmt" },
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
		notify_on_error = false,
	})

	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end
