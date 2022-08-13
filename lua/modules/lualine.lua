local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local function hide_in_width()
	return vim.fn.winwidth(0) > 80
end

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

local filetype = {
	"filetype",
	colored = true,
	icons_enabled = true,
	icon_only = false,
	icon = { align = "right" },
}

local location = {
	"location",
}

local max_file_line = function()
	local line = vim.fn.line("$")
	return line
end

local test_progress = function()
	local current_line = vim.fn.line(".")
	local total_line = vim.fn.line("$")
	local text = math.modf((current_line / total_line) * 100) .. tostring("%%")
	return text
end

local function z()
	local line = max_file_line()
	local pro = test_progress()
	return pro .. "/" .. line
end

local navic = require("nvim-navic")
navic.setup({
	icons = {
		File = " ", -- File
		Module = " ", -- Module
		Namespace = " ", -- Namespace
		Package = " ", -- Package
		Class = "ﴯ ", -- Class
		Method = " ", -- Method
		Property = " ", -- Property
		Field = "ﰠ ", -- Field
		Constructor = " ", -- Constructor
		Enum = "", -- Enum
		Interface = "ﰮ", -- Interface
		Function = " ", -- Function
		Variable = " ", -- Variable
		Constant = " ", -- Constant
		String = " ", -- String
		Number = " ", -- Number
		Boolean = "◩ ", -- Boolean
		Array = " ", -- Array
		Object = " ", -- Object
		Key = " ", -- Key
		Null = "ﳠ ", -- Null
		EnumMember = " ", -- EnumMember
		Struct = " ", -- Struct
		Event = " ", -- Event
		Operator = " ", -- Operator
		TypeParameter = " ", -- TypeParameter
	},
	highlight = false,
	separator = " > ",
})

local gps = require("nvim-gps")
gps.setup({
	disable_icons = false, -- Setting it to true will disable all icons
	icons = {
		["class-name"] = "ﴯ ", -- Classes and class-like objects
		["function-name"] = " ", -- Functions
		["method-name"] = " ", -- Methods (functions inside class-like objects)
		["container-name"] = "⛶ ", -- Containers (example: lua tables)
		["tag-name"] = "炙", -- Tags (example: html tags)
	},

	-- Add custom configuration per language or
	-- Disable the plugin for a language
	-- Any language not disabled here is enabled by default
	languages = {
		-- Some languages have custom icons
		["json"] = {
			icons = {
				["array-name"] = " ",
				["object-name"] = " ",
				["null-name"] = "[] ",
				["boolean-name"] = "ﰰﰴ ",
				["number-name"] = "# ",
				["string-name"] = " ",
			},
		},
		["latex"] = {
			icons = {
				["title-name"] = "# ",
				["label-name"] = " ",
			},
		},
		["norg"] = {
			icons = {
				["title-name"] = " ",
			},
		},
		["toml"] = {
			icons = {
				["table-name"] = " ",
				["array-name"] = " ",
				["boolean-name"] = "ﰰﰴ ",
				["date-name"] = " ",
				["date-time-name"] = " ",
				["float-name"] = " ",
				["inline-table-name"] = " ",
				["integer-name"] = "# ",
				["string-name"] = " ",
				["time-name"] = " ",
			},
		},
		["verilog"] = {
			icons = {
				["module-name"] = " ",
			},
		},
		["yaml"] = {
			icons = {
				["mapping-name"] = " ",
				["sequence-name"] = " ",
				["null-name"] = "[] ",
				["boolean-name"] = "ﰰﰴ ",
				["integer-name"] = "# ",
				["float-name"] = " ",
				["string-name"] = " ",
			},
		},
		["yang"] = {
			icons = {
				["module-name"] = " ",
				["augment-path"] = " ",
				["container-name"] = " ",
				["grouping-name"] = " ",
				["typedef-name"] = " ",
				["identity-name"] = " ",
				["list-name"] = "﬘ ",
				["leaf-list-name"] = " ",
				["leaf-name"] = " ",
				["action-name"] = " ",
			},
		},

		-- Disable for particular languages
		-- ["bash"] = false, -- disables nvim-gps for bash
		-- ["go"] = false,   -- disables nvim-gps for golang

		-- Override default setting for particular languages
		-- ["ruby"] = {
		--	separator = '|', -- Overrides default separator with '|'
		--	icons = {
		--		-- Default icons not specified in the lang config
		--		-- will fallback to the default value
		--		-- "container-name" will fallback to default because it's not set
		--		["function-name"] = '',    -- to ensure empty values, set an empty string
		--		["tag-name"] = ''
		--		["class-name"] = '::',
		--		["method-name"] = '#',
		--	}
		--}
	},

	separator = " > ",

	depth = 0,

	depth_limit_indicator = "..",
})

require("lualine").setup({
	options = {
		icons_enabled = true,
		-- theme = "nightfox",
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
		depth_limit = 0,
		depth_limit_indicator = "..",
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = { branch, diff },
		lualine_x = { diag, filetype },
		lualine_y = { location },
		lualine_z = {
			{ z, separator = { right = "" }, left_padding = 2 },
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
