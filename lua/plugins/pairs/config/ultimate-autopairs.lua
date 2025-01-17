return function()
	require("ultimate-autopair").setup({
		newline = true,
		multiline = true,
		internal_pairs = { -- *ultimate-autopair-pairs-default-pairs*
			{ "[", "]", fly = true, dosuround = true, newline = true, space = true },
			{ "(", ")", fly = true, dosuround = true, newline = true, space = true },
			{ "{", "}", fly = true, dosuround = true, newline = true, space = true },
			{
				"'",
				"'",
				suround = true,
				cond = function(fn)
					return not fn.in_lisp() or fn.in_string()
				end,
				alpha = true,
				nft = { "tex" },
				multiline = false,
			},
			{
				"`",
				"`",
				cond = function(fn)
					return not fn.in_lisp() or fn.in_string()
				end,
				nft = { "tex" },
				multiline = false,
			},
			{ "``", "''", ft = { "tex" } },
			{ "```", "```", newline = true, ft = { "markdown" } },
			{ "<!--", "-->", ft = { "markdown", "html" }, space = true },
			{ '"""', '"""', newline = true, ft = { "python" } },
			{ "'''", "'''", newline = true, ft = { "python" } },
			{ "<", ">", ft = { "markdown", "rust" } },
			-- { "<", ">", newline = true, ft = { "rust" } },
		},
		config_internal_pairs = {},
	})
end
