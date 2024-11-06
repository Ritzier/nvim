vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right" })
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Increase indent" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
