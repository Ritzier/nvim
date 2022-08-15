require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = false,
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	overrides = {},
})

require("rose-pine").setup({
	--- @usage 'main' | 'moon'
	dark_variant = "moon",
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = true,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = "base",
		panel = "surface",
		border = "highlight_med",
		comment = "muted",
		link = "iris",
		punctuation = "subtle",

		error = "love",
		hint = "iris",
		info = "foam",
		warn = "gold",

		headings = {
			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
	},

	highlight_groups = {
		ColorColumn = { bg = "rose" },
	},
})
vim.cmd("colorscheme rose-pine")

local M = {}
M.colors_scheme = { "gruvbox", "duskfox", "tokyonight", "rose-pine" }
local max = 0
for _ in pairs(M.colors_scheme) do
	max = max + 1
end
local n = 0

function M.switch_colorscheme()
	if n == max then
		n = 0
	end
	n = n + 1
	local color = M.colors_scheme[n]
	vim.cmd("colorscheme " .. color)
	local text = "Colorscheme: " .. color
	vim.notify(text, "info")
end

function M.switch_colorscheme_shift()
	n = n - 1
	if n <= 0 then
		n = max
	end
	local color = M.colors_scheme[n]
	vim.cmd("colorscheme " .. color)
	local text = "Colorscheme: " .. color
	vim.notify(text, "info")
end

vim.keymap.set(
	"n",
	"<A-b>",
	":lua require('modules.colorscheme').switch_colorscheme()<CR>",
	{ noremap = true, silent = false }
)
vim.keymap.set(
	"n",
	"<A-S-b>",
	":lua require('modules.colorscheme').switch_colorscheme_shift()<CR>",
	{ noremap = true, silent = false }
)

return M
