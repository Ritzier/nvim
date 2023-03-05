return function()
	require("todo-comments").setup({
		signs = true,
		sign_priority = 9,
		keywords = {
			FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "#a2ff45" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", color = "#7C3AED", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "☀ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			METHOD = { icon = "פֿ ", color = "#2860e9" },
		},
		gui_style = { fg = "NONE", bg = "BOLD" },
		merge_keywords = true,
		highlight = {
			multiline = true,
			multiline_pattern = "^.",
			multiline_context = 10,
			before = "",
			keyword = "wide",
			after = "fg",
			pattern = [[.*<(KEYWORDS)\s*:]],
			comments_only = true,
			max_line_len = 400,
			exclude = {},
		},
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#F44747" },
			warning = { "DiagnosticWarning", "WarningMsg", "#ff8800" },
			info = { "DiagnosticInfo", "#FFCC66" },
			hint = { "DiagnosticHint", "#4FC1FF" },
			default = { "Identifier", "#7467c0" },
			test = { "Identifier", "#FF00FF" },
		},
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			-- regex that will be used to match keywords.
			-- don't replace the (KEYWORDS) placeholder
			pattern = [[\b(KEYWORDS):]], -- ripgrep regex
			-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
		},
	})
end
