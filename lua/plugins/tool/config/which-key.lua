return function()
	require("which-key").setup({
		preset = "classic",
		triggers = {
			{ "<auto>", mode = "nixso" },
		},
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				motions = false,
				operators = false,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		win = { border = "none", padding = { 1, 2 }, wo = { winblend = 0 } },
	})
end
