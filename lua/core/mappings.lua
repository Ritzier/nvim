local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", default_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", default_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", default_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", default_opts)
keymap("n", "<C-h>", "<C-w>h", default_opts)
keymap("n", "<C-j>", "<C-w>j", default_opts)
keymap("n", "<C-k>", "<C-w>k", default_opts)
keymap("n", "<C-l>", "<C-w>l", default_opts)

keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)
keymap("v", "<A-j>", ":m .+1<CR>==", default_opts)
keymap("v", "<A-k>", ":m .-2<CR>==", default_opts)

keymap("n", "<C-n>", ":NvimTreeToggle<CR>", default_opts)

keymap("n", "<A-j>", ":BufferLineCycleNext<CR>", default_opts)
keymap("n", "<A-k>", ":BufferLineCyclePrev<CR>", default_opts)
keymap("n", "<A-S-j>", ":BufferLineMoveNext<CR>", default_opts)
keymap("n", "<A-S-k>", ":BufferLineMovePrev<CR>", default_opts)
keymap("n", "<C-x>", ":bd", default_opts)

-- Overseer
keymap("n", "<leader>oq", ":OverseerQuickAction<CR>", default_opts)
keymap("n", "<leader>oo", ":OverseerToggle<CR>", default_opts)
keymap("n", "<leader>ob", ":OverseerBuild<CR>", default_opts)
keymap("n", "<leader>r", ":OverseerRun<CR>", default_opts)
keymap("n", "<leader>t", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", default_opts)

-- Align
keymap("n", "ga", ":EasyAlign<CR>", silent)
keymap("x", "ga", ":'<, '>EasyAlign<CR>", silent)

-- Goto
keymap("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", default_opts)
keymap("n", "gt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", default_opts)
keymap("n", "gi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", default_opts)
keymap("n", "gr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", default_opts)
keymap("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", default_opts)
