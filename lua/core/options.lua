require("impatient")
local g   = vim.g
local opt = vim.opt

opt.shada          = "!,'300,<50,@100,s10,h"
opt.clipboard      = "unnamedplus"
opt.scrolloff      = 7
opt.sidescrolloff  = 7
opt.number         = true
opt.relativenumber = true
opt.undofile       = true
opt.updatetime     = 100
opt.timeoutlen     = 200
opt.timeout        = true
opt.ttimeout       = true
opt.timeoutlen     = 0
opt.ttimeoutlen    = 0
opt.redrawtime     = 1500
opt.mouse          = "a"
opt.shiftround     = true
-- opt.completeopt = "menuone,noinsert,noselect"
opt.complete       = ".,w,b,k"
opt.completeopt    = "menuone,noselect"
opt.cursorline     = true
opt.cursorcolumn   = true
opt.swapfile       = false
opt.undofile       = true
g.termguicolors    = true
opt.list           = true
opt.spell          = false
opt.jumpoptions    = "stack"

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
opt.listchars    = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"

opt.grepformat = "%f:%l:%c:%m"
opt.grepprg    = "rg --hidden --vimgrep --smart-case --"
opt.ignorecase = true

opt.showtabline   = 2
opt.winwidth      = 20
opt.winminwidth   = 10
opt.pumheight     = 20
opt.pumblend      = 10
opt.winblend      = 10
opt.helpheight    = 15
opt.previewheight = 12
opt.showcmd       = false
opt.cmdheight     = 2
opt.cmdwinheight  = 5
opt.laststatus    = 2
opt.numberwidth   = 5

opt.autoread   = true
opt.autowrite  = true
opt.redrawtime = 1500

g.syntax_on = true
g.mapleader = ","
g.speeddating_no_mappings = 1
-- g.completion_enable_auto_popup=1

vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu = 1

-- Uncomment this if you define your own filetypes in `after/ftplugin`
-- vim.g.did_load_filetypes = 1

-- Do not load native syntax completion
vim.g.loaded_syntax_completion = 1

-- Do not load spell files
vim.g.loaded_spellfile_plugin = 1

-- Whether to load netrw by default
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwFileHandlers = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrwSettings = 1
-- newtrw liststyle: https://medium.com/usevim/the-netrw-style-options-3ebe91d42456
vim.g.netrw_liststyle = 3

-- Do not load tohtml.vim
vim.g.loaded_2html_plugin = 1

-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
-- related to checking files inside compressed files)
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zipPlugin = 1

-- Do not use builtin matchit.vim and matchparen.vim since the use of vim-matchup
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

-- Disable sql omni completion.
vim.g.loaded_sql_completion = 1

-- Disable remote plugins
-- NOTE: Disabling rplugin.vim will show error for `wilder.nvim` in :checkhealth,
-- NOTE:  but since it's config doesn't require python rtp, it's fine to ignore.
-- vim.g.loaded_remote_plugins = 1

vim.cmd([[
filetype indent on
filetype plugin indent on
autocmd VimEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

vim.g.python3_host_prog = "$HOME/bin/python"


local function isempty(s)
  return s == nil or s == ""
end

local conda_prefix = os.getenv("CONDA_PREFIX")
if not isempty(conda_prefix) then
  vim.g.python_host_prog = conda_prefix .. "/bin/python"
  vim.g.python3_host_prog = conda_prefix .. "/bin/python"
end
