return function()
	require("autoclose").setup({
		keys = {
			["("] = { escape = false, close = true, pair = "()" },
			["["] = { escape = false, close = true, pair = "[]" },
			["{"] = { escape = false, close = true, pair = "{}" },

			["<"] = {
				escape = false,
				close = true,
				pair = "<>",
				enabled_filetypes = "rust",
			},

			[">"] = { escape = true, close = false, pair = "<>" },
			[")"] = { escape = true, close = false, pair = "()", fly = true },
			["]"] = { escape = true, close = false, pair = "[]", fly = true },
			["}"] = { escape = true, close = false, pair = "{}", fly = true },

			['"'] = { escape = true, close = true, pair = '""' },
			["`"] = { escape = true, close = true, pair = "``" },
			["'"] = { escape = true, close = true, pair = "''", disabled_filetypes = { "rust", "markdown" } },
		},
		options = {
			disable_when_touch = false,
			disabled_filetypes = {
				"alpha",
				"bigfile",
				"checkhealth",
				"dap-repl",
				"diff",
				"help",
				"log",
				"notify",
				"NvimTree",
				"Outline",
				"qf",
				"TelescopePrompt",
				"toggleterm",
				"undotree",
				"vimwiki",
			},
		},
	})
end
