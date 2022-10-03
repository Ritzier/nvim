require("nvim-tree").setup({
	disable_netrw = false,
	hijack_netrw = false,
	hijack_cursor = true,
	update_cwd = true,
	ignore_ft_on_setup = { "dashboard" },
	reload_on_bufenter = true,
	update_focused_file = {
	    enable = true,
	    update_cwd = true,
	},
	view = {
		side = "left",
		width = "25%",
		hide_root_folder = false,
		signcolumn = "yes",
	},
	renderer = {
		indent_markers = {
			enable = true,
			icons = {
				corner = "└",
				edge = "│ ",
				none = "  ",
			}
		},
		add_trailing = true,
		highlight_git = true,
		highlight_opened_files = "none",
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "", --
					unmerged = "שׂ",
					renamed = "", --
					untracked = "ﲉ",
					deleted = "",
					ignored = "", --◌
				},
			},
		},
	},
})
