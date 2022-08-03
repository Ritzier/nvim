local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-t>", ":TranslateW<cr>", opts)
vim.keymap.set("v", "<C-t>", ":TranslateW<cr>", opts)
