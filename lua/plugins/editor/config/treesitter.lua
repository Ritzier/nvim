return vim.schedule_wrap(function()
	vim.api.nvim_set_option_value("foldmethod", "expr", {})
	vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", {})

	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"c",
			"c_sharp",
			"cpp",
			"css",
			"csv",
			"dockerfile",
			"dot",
			"fsh",
			"go",
			"gomod",
			"gosum",
			"gowork",
			"html",
			"htmldjango",
			"javascript",
			"json",
			"json5",
			"julia",
			"lua",
			"markdown",
			"proto",
			"python",
			"query",
			"rust",
			"toml",
			"tsx",
			"typescript",
			"yaml",
			--"rust_with_rstml",
		},
		highlight = {
			enable = true,
			disable = function(ft, bufnr)
				if vim.tbl_contains({ "vim" }, ft) then
					return true
				end

				local ok, is_large_file = pcall(vim.api.nvim_buf_get_var, bufnr, "bigfile_disable_treesitter")
				return ok and is_large_file
			end,
			additional_vim_regex_highlighting = false,
		},
		textobjects = {
			select = {
				enable = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]]"] = "@parameter.inner",
				},
				goto_previous_start = {
					["[["] = "@parameter.inner",
				},
			},
		},
		indent = { enable = false },
		endwise = { enable = true },
	})
end)
