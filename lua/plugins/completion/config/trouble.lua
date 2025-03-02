return function()
	require("trouble").setup({
		auto_open = false,
		auto_close = false,
		auto_jump = false,
		auto_preview = true,
		auto_refresh = true,
		focus = false, -- do not focus the window when opened
		follow = true,
		restore = true,
	})
end
