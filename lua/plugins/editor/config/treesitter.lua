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
			"luadoc",
			"luap",
			"luau",
			"markdown",
			"proto",
			"python",
			"query",
			"rust",
			"rust_with_rstml",
			"toml",
			"tsx",
			"typescript",
			"yaml",
		},
		highlight = {
			enable = true,
			disable = function(ft)
				if vim.tbl_contains({ "vim" }, ft) then
					return true
				end
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
		-- indent = { enable = true },
		endwise = { enable = true },

		disable = function(lang, buf)
			local max_filesize = 150 * 1024 -- 150 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	})
end)
