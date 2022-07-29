local g = vim.g
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("space:⋅")
g.indent_blankline_filetype_exclude = { "help", "packer" }
g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
g.indent_blankline_show_trailing_blankline_indent = false

require("indent_blankline").setup({
	char = "┆",
	show_current_context_start = false,
	show_current_context = true,
	show_end_of_line = true,
})
