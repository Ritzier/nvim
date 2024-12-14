return function()
	require("conform").setup({
		formatters_by_ft = {
			css = { "prettierd" },
			html = { "prettierd" },
			htmldjango = { "prettierd" },
			javascript = { "prettierd" },
			jinja = { "djlint" },
			lua = { "stylua" },
			markdown = { "markdown_prettier" },
			proto = { "clang-format" },
			python = { "isort", "black" },
			rust = { "rustfmt", "leptosfmt" },
			scss = { "prettierd" },
			sh = { "beautysh" },
			toml = { "taplo" },
			tsx = { "prettier" },
			typescriptreact = { "prettier" },
			typescript = { "prettier" },
			yaml = { "yamlfmt" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Weird when enabled, write and append `markdown` file, it wouldn't format the last status
		-- format_on_save = { timeout_ms = 500, lsp_fallback = true },
		notify_on_error = false,

		format_after_save = {
			lsp_format = "fallback",
		},

		formatters = {
			markdown_prettier = {
				command = "prettier",
				args = {
					"--print-width=120",
					"--prose-wrap=always",
					"$FILENAME",
				},
			},
		},
	})

	require("conform").formatters.prettierd = {
		prepend_args = { "--tab-width=4" },
	}

	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end
