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
opt.completeopt    = "menuone,noinsert,noselect"
opt.cursorline     = true
opt.cursorcolumn   = true
opt.swapfile       = true
opt.undofile       = true
g.termguicolors    = true
opt.list           = true
opt.spell          = true

opt.expandtab    = true
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

g.mapleader = ","
g.speeddating_no_mappings = 1
-- g.completion_enable_auto_popup=1

vim.cmd([[
syntax enable
filetype indent on
filetype plugin indent on
]])
