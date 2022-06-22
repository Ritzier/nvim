local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

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

-- Buffer
keymap("n", "<A-j>", ":BufferLineCycleNext<CR>", default_opts)
keymap("n", "<A-k>", ":BufferLineCyclePrev<CR>", default_opts)
keymap("n", "<A-S-j>", ":BufferLineMoveNext<CR>", default_opts)
keymap("n", "<A-S-k>", ":BufferLineMovePrev<CR>", default_opts)
keymap("n", "<A-1>", ":BufferLineGoToBuffer 1<", default_opts)
keymap("n", "<A-2>", ":BufferLineGoToBuffer 2<", default_opts)
keymap("n", "<A-3>", ":BufferLineGoToBuffer 3<", default_opts)
keymap("n", "<A-4>", ":BufferLineGoToBuffer 4<", default_opts)
keymap("n", "<A-5>", ":BufferLineGoToBuffer 5<", default_opts)
keymap("n", "<A-6>", ":BufferLineGoToBuffer 6<", default_opts)
keymap("n", "<A-7>", ":BufferLineGoToBuffer 7<", default_opts)
keymap("n", "<A-8>", ":BufferLineGoToBuffer 8<", default_opts)
keymap("n", "<A-9>", ":BufferLineGoToBuffer 9<", default_opts)

-- NvimTree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", default_opts)
