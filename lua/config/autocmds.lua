vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
vim.opt.formatoptions = 'jcroqlnt'
vim.opt.wrap = true
vim.opt.textwidth = 80
