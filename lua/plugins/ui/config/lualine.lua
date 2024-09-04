return function()
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { statusline = { "alpha", "dashboard", "NvimTree", "Outline" } },
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = {
				"mode",
			},
			lualine_b = {
				{
					"branch",
				},

				{
					"diff",
					source = function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed,
							}
						end
					end,
				},
			},
			lualine_c = {
				-- function()
				-- 	return require("lspsaga.symbol.winbar").get_bar()
				-- end,
			},

			lualine_x = {},

			lualine_y = {
				{
					"location",
				},
			},

			lualine_z = {
				{
					function()
						local current_line = vim.fn.line(".")
						local total_line = vim.fn.line("$")
						return math.modf((current_line / total_line) * 100) .. tostring("%%") .. "/" .. total_line
					end,
				},
			},
		},
	})
end
