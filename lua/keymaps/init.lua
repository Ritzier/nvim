vim.keymap.set("n", "<C-m>", "<C-w>h", { desc = "Focus left" })
vim.keymap.set("n", "<C-h>", "<C-w>j", { desc = "Focus down" })
vim.keymap.set("n", "<C-t>", "<C-w>k", { desc = "Focus up" })
vim.keymap.set("n", "<C-s>", "<C-w>l", { desc = "Focus right" })
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Increase indent" })

vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", { silent = true })
vim.keymap.set("i", "<Esc>", "<Esc>", { silent = true })
vim.keymap.set("i", "<S-CR>", "<CR><Esc>O", { noremap = true, silent = true })
vim.keymap.set("i", "<A-CR>", "<Esc>O", { noremap = true, silent = true })
vim.keymap.set("i", "<C-CR>", "<Esc>o", { noremap = true, silent = true })

-- `;` for Mark
vim.keymap.set("n", ";", "m")

-- Disable Command History
vim.keymap.set("n", "q:", "<nop>")

vim.keymap.set({ "n", "v", "o" }, "m", "<Left>", { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "h", "<Down>", { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "t", "<Up>", { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "s", "<Right>", { noremap = true })
vim.keymap.set("v", "H", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "T", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("i", "<A-,>", "</><Left><Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<A-S-[>", "{};<Left><Left>", { noremap = true, silent = true })

vim.keymap.set("n", "U", ":redo<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v", "i" }, "<C-A-q>", ":quitall!<CR>", { noremap = true, silent = true })
