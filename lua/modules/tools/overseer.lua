return function()
	require("overseer").setup({
		-- default task strategy
		strategy = {
			"toggleterm",
			-- load your default shell before starting the task
			use_shell = false,
			-- overwrite the default toggleterm "direction" parameter
			direction = "float",
			-- overwrite the default toggleterm "highlights" parameter
			highlights = nil,
			-- overwrite the default toggleterm "auto_scroll" parameter
			auto_scroll = nil,
			-- have the toggleterm window close automatically after the task exits
			close_on_exit = false,
			-- open the toggleterm window when a task starts
			open_on_start = true,
			-- mirrors the toggleterm "hidden" parameter, and keeps the task from
			-- being rendered in the toggleable window
			hidden = false,
		},
		-- template modules to load
		templates = { "builtin", "run_file", "test" },
		-- when true, tries to detect a green color from your colorscheme to use for success highlight
		auto_detect_success_color = true,
		-- patch nvim-dap to support prelaunchtask and postdebugtask
		dap = true,
		-- configure the task list
		task_list = {
			-- default detail level for tasks. can be 1-3.
			default_detail = 1,
			-- width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- min_width and max_width can be a single value or a list of mixed integer/float types.
			-- max_width = {100, 0.2} means "the lesser of 100 columns or 20% of total"
			max_width = { 100, 0.2 },
			-- min_width = {40, 0.1} means "the greater of 40 columns or 10% of total"
			min_width = { 40, 0.1 },
			-- optionally define an integer/float for the exact width of the task list
			width = nil,
			-- string that separates tasks
			separator = "────────────────────────────────────────",
			-- default direction. can be "left" or "right"
			direction = "left",
			-- set keymap to false to remove default behavior
			-- you can add custom keymaps here as well (anything vim.keymap.set accepts)
			bindings = {
				["?"] = "showhelp",
				["<cr>"] = "runaction",
				["<c-e>"] = "edit",
				["o"] = "open",
				["<c-v>"] = "openvsplit",
				["<c-s>"] = "opensplit",
				["<c-f>"] = "openfloat",
				["<c-q>"] = "openquickfix",
				["p"] = "togglepreview",
				["<c-l>"] = "increasedetail",
				["<c-h>"] = "decreasedetail",
				["l"] = "increasealldetail",
				["h"] = "decreasealldetail",
				["["] = "decreasewidth",
				["]"] = "increasewidth",
				["{"] = "prevtask",
				["}"] = "nexttask",
			},
		},
		-- see :help overseer-actions
		actions = {},
		-- configure the floating window used for task templates that require input
		-- and the floating window used for editing tasks
		form = {
			border = "rounded",
			zindex = 40,
			-- dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- min_x and max_x can be a single value or a list of mixed integer/float types.
			min_width = 80,
			max_width = 0.9,
			width = nil,
			min_height = 10,
			max_height = 0.9,
			height = nil,
			-- set any window options here (e.g. winhighlight)
			win_opts = {
				winblend = 10,
			},
		},
		task_launcher = {
			-- set keymap to false to remove default behavior
			-- you can add custom keymaps here as well (anything vim.keymap.set accepts)
			bindings = {
				i = {
					["<c-s>"] = "submit",
					["<c-c>"] = "cancel",
				},
				n = {
					["<cr>"] = "submit",
					["<c-s>"] = "submit",
					["q"] = "cancel",
					["?"] = "showhelp",
				},
			},
		},
		task_editor = {
			-- set keymap to false to remove default behavior
			-- you can add custom keymaps here as well (anything vim.keymap.set accepts)
			bindings = {
				i = {
					["<cr>"] = "nextorsubmit",
					["<c-s>"] = "submit",
					["<tab>"] = "next",
					["<s-tab>"] = "prev",
					["<c-c>"] = "cancel",
				},
				n = {
					["<cr>"] = "nextorsubmit",
					["<c-s>"] = "submit",
					["<tab>"] = "next",
					["<s-tab>"] = "prev",
					["q"] = "cancel",
					["?"] = "showhelp",
				},
			},
		},
		-- configure the floating window used for confirmation prompts
		confirm = {
			border = "rounded",
			zindex = 40,
			-- dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- min_x and max_x can be a single value or a list of mixed integer/float types.
			min_width = 20,
			max_width = 0.5,
			width = nil,
			min_height = 6,
			max_height = 0.9,
			height = nil,
			-- set any window options here (e.g. winhighlight)
			win_opts = {
				winblend = 10,
			},
		},
		-- configuration for task floating windows
		task_win = {
			-- how much space to leave around the floating window
			padding = 2,
			border = "rounded",
			-- set any window options here (e.g. winhighlight)
			win_opts = {
				winblend = 10,
			},
		},
		-- aliases for bundles of components. redefine the builtins, or create your own.
		component_aliases = {
			-- most tasks are initialized with the default components
			default = {
				{ "display_duration", detail_level = 2 },
				"on_output_summarize",
				"on_exit_set_status",
				"on_complete_notify",
				"on_complete_dispose",
			},
			-- tasks from tasks.json use these components
			default_vscode = {
				"default",
				"on_result_diagnostics",
				"on_result_diagnostics_quickfix",
			},
		},
		bundles = {
			-- when saving a bundle with overseersavebundle or save_task_bundle(), filter the tasks with
			-- these options (passed to list_tasks())
			save_task_opts = {
				bundleable = true,
			},
		},
		-- a list of components to preload on setup.
		-- only matters if you want them to show up in the task editor.
		preload_components = {},
		-- controls when the parameter prompt is shown when running a template
		--   always    show when template has any params
		--   missing   show when template has any params not explicitly passed in
		--   allow     only show when a required param is missing
		--   avoid     only show when a required param with no default value is missing
		--   never     never show prompt (error if required param missing)
		default_template_prompt = "allow",
		-- for template providers, how long to wait (in ms) before timing out.
		-- set to 0 to disable timeouts.
		template_timeout = 3000,
		-- cache template provider results if the provider takes longer than this to run.
		-- time is in ms. set to 0 to disable caching.
		template_cache_threshold = 100,
		-- configure where the logs go and what level to use
		-- types are "echo", "notify", and "file"
		log = {
			{
				type = "echo",
				level = vim.log.levels.warn,
			},
			{
				type = "file",
				filename = "overseer.log",
				level = vim.log.levels.warn,
			},
		},
	})
end
