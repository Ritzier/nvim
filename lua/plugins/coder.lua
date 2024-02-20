return {
	{
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup({
				strategy = {
					"toggleterm",
					use_shell = false,
					direction = "float",
				},
				dap = true,
				task_list = {
					max_width = { 100, 0.2 },
					min_width = { 40, 0.1 },
					max_height = { 20, 0.1 },
					min_height = 8,
					direction = "flaot",
					default_detail = 1,
					bindings = {
						["q"] = function()
							vim.cmd("OverseerClose")
						end,
					},
				},
				templates = { "sh" },
			})

			vim.api.nvim_create_user_command("WatchRun", function()
				local overseer = require("overseer")
				overseer.run_template({ name = "sh" }, function(task)
					if task then
						task:add_component({ "restart_on_save", paths = { vim.fn.expand("%:p") } })
						local main_win = vim.api.nvim_get_current_win()
						overseer.run_action(task, "open vsplit")
						vim.api.nvim_set_current_win(main_win)
					else
						vim.notify("WatchRun not supported for filetype " .. vim.bo.filetype, vim.log.levels.ERROR)
					end
				end)
			end, {})
		end,
	},

	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	ft = "markdown",
	-- 	build = ":call mkdp#util#install()",
	-- 	keys = {
	-- 		{ "1", "<cmd>MarkdownPreviewToggle<CR>" },
	-- 	},
	-- },

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{
		"pocco81/auto-save.nvim",
		lazy = false,
		config = function()
			require("auto-save").setup()
		end,
	},
}
