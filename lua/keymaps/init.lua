vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Increase indent" })
vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", { silent = true })
vim.keymap.set("i", "<Esc>", "<Esc>", { silent = true })
vim.keymap.set("i", "<S-CR>", "<CR><Esc>O", { noremap = true, silent = true })
vim.keymap.set("i", "<A-CR>", "<Esc>O", { noremap = true, silent = true })
vim.keymap.set("i", "<C-CR>", "<Esc>o", { noremap = true, silent = true })

vim.keymap.set("n", "U", ":redo<CR>", { noremap = true, silent = true })

require("keymaps.mtgap")
