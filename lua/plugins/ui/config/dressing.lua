return function()
	require("dressing").setup({
		input = {
			relative = "editor",
			border = "rounded",
			win_options = {
				winhighlight = "FloatBorder:GlanceWinBarTitle",
				-- winhighlight = "DressingTitle:DressingBorder",
			},
		},
	})
	-- vim.api.nvim_set_hl(0, "FloatTitle", { link = "Normal" })
end
