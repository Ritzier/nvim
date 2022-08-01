local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.load_extension("media_files")
telescope.load_extension("packer")

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		layout_strategy = "horizontal",
		theme = "ivy",
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		layout_config = {
			prompt_position = "bottom",
			horizontal = { preview_width = 0.5 },
		},
		extensions = {
			media_files = {
				-- filetypes whitelist
				-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
				filetypes = { "png", "webp", "jpg", "jpeg" },
				find_cmd = "rg", -- find command (defaults to `fd`)
			},
			packer = {
				theme = "ivy",
			},
		},
	},
})

local wk = require("which-key")
wk.register({
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		l = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		p = { "<cmd>Telescope packer<cr>", "Packer" },
	},
}, { prefix = "<leader>" })
