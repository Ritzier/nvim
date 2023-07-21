return function(opts)
	local null_ls = require("null-ls")
	require("null-ls").setup({
		on_attach = opts.on_attach,
		sources = {
			-- Bash
			null_ls.builtins.code_actions.shellcheck,
			null_ls.builtins.diagnostics.shellcheck,
			-- null_ls.builtins.formatting.beautysh.with({
			-- 	filetypes = { "bash", "csh", "ksh", "sh", "zsh", "nu" },
			-- }),
			null_ls.builtins.diagnostics.dotenv_linter,
			null_ls.builtins.formatting.shellharden.with({
				filetypes = { "sh" },
			}),

			-- Rust
			null_ls.builtins.formatting.rustfmt,

			-- Lua
			-- null_ls.builtins.diagnostics.luacheck,
			-- null_ls.builtins.diagnostics.selene,
			null_ls.builtins.formatting.stylua,

			-- Json
			null_ls.builtins.formatting.prettierd,
		},
	})
end
