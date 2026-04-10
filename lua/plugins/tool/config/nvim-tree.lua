return function()
	local nvim_tree = require("nvim-tree")

	nvim_tree.setup({
		auto_reload_on_write = true,
		disable_netrw = false,
		hijack_netrw = true,
		hijack_cursor = true,
		hijack_unnamed_buffer_when_opening = false,
		open_on_tab = false,
		sort_by = "name",
		update_cwd = true,
		view = {
			width = 30,
			side = "left",
			preserve_window_proportions = false,
			number = false,
			relativenumber = false,
			signcolumn = "yes",
		},
		renderer = {
			indent_markers = {
				enable = true,
				icons = {
					corner = "└",
					edge = "│",
					item = "│",
					bottom = "─",
					none = " ",
				},
			},
			icons = {
				webdev_colors = true,
				glyphs = {
					default = "",
					symlink = "",
					bookmark = "󰃃",
					git = {
						unstaged = "",
						staged = "",
						unmerged = "󰘬",
						renamed = "",
						untracked = "󰞋",
						deleted = "",
						ignored = "",
					},
					folder = {
						arrow_open = "",
						arrow_closed = "",
						default = "󰉋",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
					},
				},
			},
		},
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
		update_focused_file = {
			enable = true,
			update_cwd = false,
			ignore_list = {},
		},
		diagnostics = {
			enable = false,
			show_on_dirs = false,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		filters = {
			dotfiles = false,
			custom = {},
			exclude = {},
		},
		git = {
			enable = true,
			ignore = true,
			timeout = 400,
		},
		actions = {
			use_system_clipboard = true,
			change_dir = {
				enable = true,
				global = false,
				restrict_above_cwd = false,
			},
			open_file = {
				quit_on_open = false,
				resize_window = false,
				window_picker = {
					enable = true,
					chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
					exclude = {
						filetype = { "notify", "qf", "diff", "fugitive", "fugitiveblame" },
						buftype = { "nofile", "terminal", "help" },
					},
				},
			},
		},
		trash = {
			cmd = "trash",
			require_confirm = true,
		},
		log = {
			enable = false,
			truncate = false,
			types = {
				all = false,
				config = false,
				copy_paste = false,
				diagnostics = false,
				git = false,
				profile = false,
			},
		},
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")

			api.config.mappings.default_on_attach(bufnr)

			local function create_in_cursor_dir()
				local node = api.tree.get_node_under_cursor()
				-- Get target path based on node under cursor
				local target_path
				if node.type == "directory" and node.open then
					target_path = node.absolute_path
				else
					target_path = vim.fn.fnamemodify(node.absolute_path, ":h")
				end

				vim.ui.input({ prompt = "Create file: ", default = target_path .. "/" }, function(name)
					if not name then
						return
					end

					-- Create parent directories if they don't exist
					local parent_dir = vim.fn.fnamemodify(name, ":h")
					vim.fn.mkdir(parent_dir, "p")

					-- Handle directory creation (ends with /)
					if name:sub(-1) == "/" then
						vim.fn.mkdir(name, "p")
					else
						-- Create file
						local file = io.open(name, "w")
						if file then
							file:close()
						end
					end

					-- Refresh tree
					api.tree.reload()
				end)
			end

			vim.keymap.set("n", "a", create_in_cursor_dir, { desc = "", buffer = bufnr, noremap = true, silent = true })
		end,
	})
end
