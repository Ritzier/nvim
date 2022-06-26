local api = vim.api
local g = vim.g
local opt = vim.opt

g.mapleader = ","
g.maplocalleader = ","

opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch       = true --Set highlight on search
opt.hidden         = true
opt.number         = true --Make line numbers default
opt.relativenumber = true --Make relative number default
opt.mouse          = "a" --Enable mouse mode
opt.breakindent    = true --Enable break indent
opt.undofile       = true --Save undo history
opt.ignorecase     = true --Case insensitive searching unless /C or capital in search
opt.smartcase      = true -- Smart case
opt.updatetime     = 250 --Decrease update time
opt.signcolumn     = "yes" -- Always show sign column
opt.clipboard      = "unnamedplus" -- Access system clipboard
opt.backup         = false
opt.writebackup    = false
opt.swapfile       = false
opt.timeout        = true
opt.ttimeout       = true
opt.timeoutlen     = 500
opt.ttimeoutlen    = 0
opt.updatetime     = 100
opt.redrawtime         = 1500
opt.cursorline     = true
opt.cursorcolumn   = true
opt.scrolloff      = 8
opt.sidescrolloff  = 8
opt.list           = true
opt.listchars: append("space:⋅")
opt.listchars: append("eol:↴")
opt.wrap           = true
opt.expandtab      = true
opt.shiftwidth     = 4
opt.tabstop        = 4
opt.softtabstop    = 4
opt.smartindent    = true
opt.autoindent = true
opt.virtualedit = block

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

local default_plugins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "python3_provider",
   "python_provider",
   "node_provider",
   "ruby_provider",
   "perl_provider",
   "tutor",
   "rplugin",
   "syntax",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(default_plugins) do
   g["loaded_" .. plugin] = 1
end
