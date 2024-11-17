return function()
	require("conform").setup({
		formatters_by_ft = {
			css = { "prettier" },
			html = { "prettier" },
			javascript = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			proto = { "clang-format" },
			python = { "isort", "black" },
			rust = { "rustfmt", "leptosfmt" },
			scss = { "prettier" },
			sh = { "beautysh" },
			toml = { "taplo" },
			typescript = { "prettier" },
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

	-- Prettier format with 4 tab width
	require("conform").formatters.prettier = {
		prepend_args = { "--tab-width", "4" },
	}

	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end
