return function()
	local lualine = require("lualine")

	lualine.setup({
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
				statusline = 100,
				tabline = 100,
				winbar = 100,
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

				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					sections = { "error", "warn", "info", "hint" },
				},
			},

			lualine_c = {
				{
					"overseer",
					label = "",
					colored = true,
					symbols = {
						[require("overseer").STATUS.FAILURE] = "F:",
						[require("overseer").STATUS.CANCELED] = "C:",
						[require("overseer").STATUS.SUCCESS] = "S:",
						[require("overseer").STATUS.RUNNING] = "R:",
					},
					unique = false,
					name = nil,
					name_not = false,
					status = nil,
					status_not = false,
				},
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

		inactive_sections = {},

		tabline = {},

		winbar = {},

		inactive_winbar = {},

		extensions = {},
	})
end
