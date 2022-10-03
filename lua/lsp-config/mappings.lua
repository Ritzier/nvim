local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

keymap("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", default_opts)
keymap("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", default_opts)
keymap("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", default_opts)
keymap("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", default_opts)
keymap("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", default_opts)
