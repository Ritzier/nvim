local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    print("Lualine not work")
    return
end
local status_ok2, gps = pcall(require, "nvim-gps")
if not status_ok2 then
    print("nvim-gps not work")
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	diff_color = {
		added = { fg = "#98be65" },
		modified = { fg = "#FF8800" },
		removed = { fg = "#ec5f67" },
	},
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	colored = true,
	icons_enabled = true,
	icon_only = false,
	icon = { align = "right" },
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local test_progress = function()
	local current_line = vim.fn.line(".")
	local total_line = vim.fn.line("$")
	local text = math.modf((current_line / total_line) * 100) .. tostring("%%")
	return text
end

local max_file_line = function()
	local line = vim.fn.line("$")
	return line
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local diag = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = "#ec5f67" },
		color_warn = { fg = "#ECBE7B" },
		color_info = { fg = "#008080" },
	},
}

local function z()
	local line = max_file_line()
	local pro = test_progress()
	return pro .. "/" .. line
end

local gps = require("nvim-gps")

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = { branch, diff },
		lualine_c = {
            { gps.get_location, cond = gps.is_available },
        },
		lualine_x = { diag, filetype },
		lualine_y = { location },
		lualine_z = {
			{ z, separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
