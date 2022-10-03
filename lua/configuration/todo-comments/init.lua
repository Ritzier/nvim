local error_red = "#F44747"
local warning_orange = "#ff8800"
local info_yellow = "#FFCC66"
local hint_blue = "#4FC1FF"
local perf_purple = "#7C3AED"

require("todo-comments").setup {
	signs = true,
	keywords = {
		FIX = { icon = "", color = error_red },
		TODO = { icon = "", color = hint_blue },
		HACK = { icon = "î ", color = warning_orange },
		WARN = { icon = " ", color = warning_orange },
		PERF = { icon = " ", color = perf_purple },
		NOTE = { icon = " ", color = info_yellow },
	},
}
