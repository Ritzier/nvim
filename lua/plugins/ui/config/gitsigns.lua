return function()
	require("gitsigns").setup({
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged_enable = true,
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		attach_to_untracked = false,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000, -- Disable if file is longer than this (in lines)
		preview_config = {
			-- Options passed to nvim_open_win
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		-- Keymap
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map("n", "]g", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end)

			map("n", "[g", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end)

			map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Git Stage Hunk" })
			map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Git Reset Hunk" })
			map("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git Stage Hunk" })
			map("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git Reset Hunk" })
			map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Git Stage Buffer" })
			map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Git Undo Stage Hunk" })
			map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Git Reset Buffer" })
			map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Git Preview Hunk" })
			map("n", "<leader>gb", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Git Blame Line" })
			map("n", "<leader>gD", gitsigns.toggle_current_line_blame, { desc = "Git Toggle Line Blame" })
			map("n", "<leader>gt", gitsigns.diffthis, { desc = "Git Diff This" })
			map("n", "<leader>gT", function()
				gitsigns.diffthis("~")
			end, { desc = "Git DiffThis" })
			map("n", "<leader>ggd", gitsigns.toggle_deleted, { desc = "Git Toggle Deleted" })
			map("n", "<leader>ggw", gitsigns.toggle_word_diff, { desc = "Git Toggle Word Diff" })
			map("n", "<leader>ggl", gitsigns.toggle_linehl, { desc = "Git Toggle LineHL" })
			map("n", "<leader>ggs", gitsigns.toggle_signs, { desc = "Git Toggle Signs" })
			map("n", "<leader>ggn", gitsigns.toggle_numhl, { desc = "Git Toggle NumHL" })
		end,
	})
end
