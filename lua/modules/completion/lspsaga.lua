return function()
	-- require("utils").gen_lspkind_hl()

	local icons = {
		cmp = require("utils.icons").get("cmp", true),
		diagnostics = require("utils.icons").get("diagnostics", true),
		kind = require("utils.icons").get("kind", true),
		type = require("utils.icons").get("type", true),
		ui = require("utils.icons").get("ui", true),
	}

	local function set_sidebar_icons()
		-- Set icons for sidebar.
		local diagnostic_icons = {
			Error = icons.diagnostics.Error_alt,
			Warn = icons.diagnostics.Warning_alt,
			Info = icons.diagnostics.Information_alt,
			Hint = icons.diagnostics.Hint_alt,
		}
		for type, icon in pairs(diagnostic_icons) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl })
		end
	end

	set_sidebar_icons()

	require("lspsaga").setup({
		preview = {
			lines_above = 1,
			lines_below = 17,
		},
		scroll_preview = {
			scroll_down = "<C-j>",
			scroll_up = "<C-k>",
		},
		request_timeout = 3000,
		finder = {
			keys = {
				jump_to = "e",
				edit = { "o", "<CR>" },
				vsplit = "s",
				split = "i",
				tabe = "t",
				quit = { "q", "<ESC>" },
				close_in_preview = "<ESC>",
			},
		},
		definition = {
			edit = "<C-c>o",
			vsplit = "<C-c>v",
			split = "<C-c>s",
			tabe = "<C-c>t",
			quit = "q",
		},
		code_action = {
			num_shortcut = true,
			keys = {
				quit = "q",
				exec = "<CR>",
			},
		},
		lightbulb = {
			enable = false,
			sign = true,
			enable_in_insert = true,
			sign_priority = 20,
			virtual_text = false,
		},
		diagnostic = {
			on_insert = false,
			on_insert_follow = false,
			show_code_action = true,
			show_virt_line = true,
			show_source = true,
			border_follow = true,
			jump_num_shortcut = true,
			keys = {
				exec_action = "<CR>",
				quit = "q",
				go_action = "g",
			},
		},
		rename = {
			quit = "<C-c>",
			mark = "x",
			confirm = "<CR>",
			exec = "<CR>",
			in_select = true,
		},
		outline = {
			win_position = "right",
			win_with = "_sagaoutline",
			win_width = 30,
			auto_preview = false,
			auto_refresh = true,
			auto_close = true,
			keys = {
				jump = "<CR>",
				expand_collapse = "u",
				quit = "q",
			},
		},
		symbol_in_winbar = {
			enable = true,
			separator = " " .. icons.ui.Separator,
			hide_keyword = true,
			show_file = false,
			color_mode = true,
		},
		beacon = {
			enable = true,
			frequency = 12,
		},
		ui = {
			border = "single", -- Can be single, double, rounded, solid, shadow.
			winblend = 0,
			expand = icons.ui.ArrowClosed,
			collapse = icons.ui.ArrowOpen,
			code_action = icons.ui.CodeAction,
			incoming = icons.ui.Incoming,
			outgoing = icons.ui.Outgoing,
			diagnostic = " " .. icons.cmp.nvim_lsp,
			
		},
	})
end
