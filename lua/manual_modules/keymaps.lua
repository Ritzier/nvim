local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- Nvim-Tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", default_opts)

--BufferLine
keymap("n", "<A-j>", ":BufferLineCycleNext<CR>", default_opts)
keymap("n", "<A-k>", ":BufferLineCyclePrev<CR>", default_opts)
keymap("n", "<A-S-j>", ":BufferLineMoveNext<CR>", default_opts)
keymap("n", "<A-S-k>", ":BufferLineMovePrev<CR>", default_opts)
keymap("n", "<C-x>", ":bd", default_opts)

-- Format
keymap("n", "<leader>f", ":w:!stylua %<CR>", default_opts)
