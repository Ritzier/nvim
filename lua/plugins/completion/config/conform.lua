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
			typescript = { "prettier" },
			scss = { "prettier" },
			toml = { "taplo" },
			yaml = { "yamlfmt" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
		notify_on_error = false,

		format_after_save = {
			lsp_format = "fallback",
		},
	})

	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end
