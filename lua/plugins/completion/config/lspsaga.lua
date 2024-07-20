return function()
	require("lspsaga").setup({
		symbol_in_winbar = {
			enable = true,
			hide_keyword = false,
			show_file = false,
			folder_level = 1,
			color_mode = true,
			delay = 100,
		},
		-- Callhierarchy: https://nvimdev.github.io/lspsaga/callhierarchy/
		callhierarchy = {
			layout = "float",
			keys = {
				edit = "e",
				vsplit = "v",
				split = "s",
				tabe = "t",
				quit = "q",
				shuttle = "[]",
				toggle_or_req = "u",
				close = "<Esc>",
			},
		},
		-- Code Action: https://nvimdev.github.io/lspsaga/codeaction/
		code_action = {
			num_shortcut = true,
			only_in_cursor = false,
			show_server_name = true,
			extend_gitsigns = false,
			keys = {
				quit = "q",
				exec = "<CR>",
			},
		},
		-- Diagnostics: https://nvimdev.github.io/lspsaga/diagnostic/
		diagnostic = {
			show_code_action = true,
			jump_num_shortcut = true,
			max_width = 0.5,
			max_height = 0.6,
			text_hl_follow = true,
			border_follow = true,
			extend_relatedInformation = true,
			show_layout = "float",
			show_normal_height = 10,
			max_show_width = 0.9,
			max_show_height = 0.6,
			diagnostic_only_current = false,
			keys = {
				exec_action = "r",
				quit = "q",
				toggle_or_jump = "<CR>",
				quit_in_show = { "q", "<Esc>" },
			},
		},
		-- Hover: https://nvimdev.github.io/lspsaga/hover/
		hover = {
			max_width = 0.45,
			max_height = 0.7,
			open_link = "gl",
			open_cmd = "silent !chrome-cli open",
		},
		-- Impl: https://nvimdev.github.io/lspsaga/implement/
		implement = {
			enable = true,
			sign = true,
			virtual_text = false,
			priority = 100,
		},
		-- LightBulb: https://nvimdev.github.io/lspsaga/lightbulb/
		lightbulb = {
			enable = false,
			sign = true,
			virtual_text = false,
			debounce = 10,
			sign_priority = 20,
		},
		-- Rename: https://nvimdev.github.io/lspsaga/rename/
		rename = {
			in_select = false,
			auto_save = false,
			project_max_width = 0.5,
			project_max_height = 0.5,
			keys = {
				quit = "<C-c>",
				exec = "<CR>",
				select = "x",
			},
		},
		-- Beacon: https://nvimdev.github.io/lspsaga/misc/#beacon
		beacon = {
			enable = true,
			frequency = 12,
		},
		-- Generic UI Options: https://nvimdev.github.io/lspsaga/misc/#generic-ui-options
		ui = {
			border = "single", -- Can be single, double, rounded, solid, shadow.
			lines = { "┗", "┣", "┃", "━", "┏" },
		},
		-- Scrolling Keymaps: https://nvimdev.github.io/lspsaga/misc/#scrolling-keymaps
		scroll_preview = {
			scroll_down = "<C-d>",
			scroll_up = "<C-u>",
		},
		request_timeout = 3000,
	})
end
