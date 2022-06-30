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
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", default_opts)

keymap("n", "<A-j>", ":BufferLineCycleNext<CR>", default_opts)
keymap("n", "<A-k>", ":BufferLineCyclePrev<CR>", default_opts)
keymap("n", "<A-S-j>", ":BufferLineMoveNext<CR>", default_opts)
keymap("n", "<A-S-k>", ":BufferLineMovePrev<CR>", default_opts)

keymap('n', '<leader>tg', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', default_opts)
keymap('n', '<leader>tr', '<cmd>lua _RANGER_TOGGLE()<CR>', default_opts)

keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', default_opts)
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', default_opts)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', default_opts)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', default_opts)
keymap('n', 'gk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', default_opts)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', default_opts)
keymap('n', '<leader>ca', '<cmd>CodeActionMenu <CR>', default_opts)
keymap('n', 'gl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "single" })<CR>', default_opts)
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ border = "single" })<CR>', default_opts)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ border = "single" })<CR>', default_opts)

keymap('n', '<leader>mp', ':MarkdownPreview<CR>', default_opts)

return M
