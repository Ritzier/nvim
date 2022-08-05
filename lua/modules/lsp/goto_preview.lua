require("goto-preview").setup()
-- local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<cmd>lua require('goto-preview').goto_preview_implementation()", opts)
-- vim.api.nvim_set_keymap("n", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", opts)
local wk = require("which-key")
wk.register({
	g = {
		name = "GoTo-Preview",
		d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Definition" },
		r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "References" },
		t = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "Type Definition" },
		i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Implementation" },
		c = { "<cmd>lua require('goto-preview').close_all_win()", "Close All Buffer" },
	},
}, { prefix = "<leader>" })
