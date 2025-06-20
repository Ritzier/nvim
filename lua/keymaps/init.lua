vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right" })
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Increase indent" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", { silent = true })
vim.keymap.set("i", "<Esc>", "<Esc>", { silent = true })
vim.keymap.set("i", "<S-CR>", "<CR><Esc>O", { noremap = true, silent = true })
vim.keymap.set("i", "<A-CR>", "<Esc>O", { noremap = true, silent = true })
vim.keymap.set("i", "<C-CR>", "<Esc>o", { noremap = true, silent = true })

-- `;` for Mark
vim.keymap.set("n", ";", "m")

-- Disable Command History
vim.keymap.set("n", "q:", "<nop>")

vim.keymap.set("i", "<A-,>", "</><Left><Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<A-S-[>", "{};<Left><Left>", { noremap = true, silent = true })

vim.keymap.set("n", "U", ":redo<CR>", { noremap = true, silent = true })
