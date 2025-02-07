vim.keymap.set({ "n", "v", "o" }, "m", "<Left>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "o" }, "h", "<Down>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "o" }, "t", "<Up>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "o" }, "s", "<Right>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-m>", "<C-w><Left>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w><Down>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", "<C-w><Up>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", "<C-w><Right>", { noremap = true, silent = true })

vim.keymap.set("n", "<S-h>", "<S-j>")

vim.keymap.set("v", "H", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "T", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
