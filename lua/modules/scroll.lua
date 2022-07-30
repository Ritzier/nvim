require("neoscroll").setup({
	mappings = { "<C-u>", "<C-d>" },
	hide_cursor = true,
	stop_eof = true,
	respect_scrolloff = true,
	cursor_scrolls_alone = true,
	easing_function = nil,
	pre_hook = nil,
	post_hook = nil,
	performance_mode = false,
})

local t = {}
t["<C-u>"] = { "scroll", { "-0.10", "false", "100" } }
t["<C-d>"] = { "scroll", { "0.10", "false", "100" } }

require("neoscroll.config").set_mappings(t)
