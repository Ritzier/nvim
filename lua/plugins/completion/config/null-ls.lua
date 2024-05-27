return function()
	local null_ls = require("null-ls")
	local btns = null_ls.builtins

	local sources = {
		btns.formatting.clang_format.with({
			filetypes = { "c", "cpp" },
			-- extra_args = formatter_args("clang_format"),
		}),
		btns.formatting.prettier.with({
			filetypes = {
				"vue",
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
				"yaml",
				"html",
				"css",
				"scss",
				"sh",
				"markdown",
			},
		}),

		btns.diagnostics.markdownlint,
		-- btns.diagnostics.write_good,
		-- btns.formatting.markdownlint,
	}

	require("null-ls").setup({
		border = "rounded",
		debug = false,
		log_level = "warn",
		update_in_insert = false,
		sources = sources,

	})

	require("plugins.completion.config.mason-null-ls")
end
