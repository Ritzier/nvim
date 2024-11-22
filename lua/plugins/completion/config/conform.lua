return function()
	require("conform").setup({
		formatters_by_ft = {
			css = { "prettierd" },
			html = { "prettierd" },
			htmldjango = { "prettierd" },
			javascript = { "prettierd" },
			jinja = { "djlint" },
			lua = { "stylua" },
			markdown = { "prettierd" },
			proto = { "clang-format" },
			python = { "isort", "black" },
			rust = { "rustfmt", "leptosfmt" },
			scss = { "prettierd" },
			sh = { "beautysh" },
			toml = { "taplo" },
			typescript = { "prettierd" },
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

	require("conform").formatters.prettierd = {
		prepend_args = { "--tab-width=4" },
	}

	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end
