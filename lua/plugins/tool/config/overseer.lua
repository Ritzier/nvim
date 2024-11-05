return function()
	require("overseer").setup({
		templates = { "builtin", "filetype.python", "filetype.lua" },
		task_list = {
			default_detial = 1,
			direction = "left",
			max_width = { 100, 0.2 },
			min_width = { 25, 0.1 },
		},
	})
end
