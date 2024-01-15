return {
	{
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup({
				task_list = {
					direction = "bottom",
					min_height = 25,
					max_height = 25,
					default_detail = 1,
					bindings = {
						["q"] = function()
							vim.cmd("OverseerClose")
						end,
					},
				},
				templates = { "common" },
			})
		end,
	},

	{
		"iamcco/markdown-preview.nvim",
		-- cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = "markdown",
		build = ":call mkdp#util#install()",
		keys = {
			{ "1", "<cmd>MarkdownPreviewToggle<CR>" },
		},
	},
}
