return function()
	require("todo-comments").setup({
		signs = false, -- show icons in the signs column
		keywords = {
			FIX = {
				icon = "󰃤",
				color = "error",
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
			},
			TODO = { icon = "", color = "info" },
			-- HACK = { icon = icons.ui.Fire, color = "warning" },
			WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = "󰅒", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = "", color = "hint", alt = { "INFO" } },
			TEST = { icon = "󰙨", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
		gui_style = {
			fg = "NONE",
			bg = "BOLD",
		},
		merge_keywords = true,
		highlight = {
			multiline = false,
			keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
			after = "",
			comments_only = true,
			max_line_len = 500,
			exclude = { "big_file_disabled_ft", "checkhealth" },
		},
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
			info = { "DiagnosticInfo", "#2563EB" },
			hint = { "DiagnosticHint", "#F5C2E7" },
			default = { "Conditional", "#7C3AED" },
		},
	})
end
