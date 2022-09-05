require("impatient")
local g   = vim.g
local opt = vim.opt

opt.clipboard      = "unnamed,unnamedplus"
opt.scrolloff      = 7
opt.sidescrolloff  = 7
opt.number         = true
opt.relativenumber = true
opt.undofile       = true
opt.updatetime     = 100
opt.timeoutlen     = 200
opt.timeout        = true
opt.ttimeout       = true
opt.timeoutlen     = 500
opt.ttimeoutlen    = 0
opt.redrawtime     = 1500
opt.mouse          = "a"
opt.completeopt    = "menu,menuone,noselect"
opt.cursorline     = true
opt.cursorcolumn   = true
opt.swapfile       = true
opt.undofile       = true
g.termguicolors    = true
opt.list           = true

opt.smartcase    = true
opt.smartindent  = true
opt.smarttab     = true
opt.autoindent   = true
opt.softtabstop  = 2
opt.tabstop      = 2
opt.showtabline  = 2
opt.shiftwidth   = 2
opt.backspace    = "indent,eol,start"
opt.backup       = false
opt.conceallevel = 0
opt.encoding     = "utf-8"
opt.errorbells   = false
opt.fileencoding = "utf-8"
opt.incsearch    = true
opt.showmode     = false

opt.showtabline   = 2
opt.winwidth      = 30
opt.winminwidth   = 10
opt.pumheight     = 20
opt.helpheight    = 15
opt.previewheight = 12
opt.showcmd       = false
opt.cmdheight     = 1
opt.cmdwinheight  = 5
opt.laststatus    = 2
opt.numberwidth   = 5

opt.autoread  = true
opt.autowrite = true

g.mapleader = " "
g.speeddating_no_mappings = 1

vim.opt.shortmess:append('c');
vim.opt.formatoptions:remove('c');
vim.opt.formatoptions:remove('r');
vim.opt.formatoptions:remove('o');
vim.opt.fillchars:append('stl: ');
vim.opt.fillchars:append('eob: ');
vim.opt.fillchars:append('fold: ');
vim.opt.fillchars:append('foldopen: ');
vim.opt.fillchars:append('foldsep: ');
vim.opt.fillchars:append('foldclose:');

vim.cmd('colorscheme duskfox')
vim.cmd([[
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
syntax enable
]])
