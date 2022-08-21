local g = vim.g
local opt = vim.opt

g.mapleader = " "

vim.cmd([[
autocmd BufEnter * set indentexpr=
]])

opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true --Set highlight on search
opt.number = true --Make line numbers default
opt.relativenumber = true --Make relative number default
opt.mouse = "a" --Enable mouse mode
opt.breakindent = true --Enable break indent
opt.undofile = true --Save undo history
opt.ignorecase = true --Case insensitive searching unless /C or capital in search
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.errorbells = false
opt.smartcase = true -- Smart case
opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.timeoutlen = 300 --	Time in milliseconds to wait for a mapped sequence to complete.
opt.showmode = false -- Do not need to show the mode. We use the statusline instead.
opt.scrolloff = 8 -- Lines of context
opt.sidescrolloff = 8
opt.joinspaces = false -- No double spaces with join after a dot
opt.sessionoptions = "buffers,curdir,help,tabpages,winsize,winpos,terminal"
opt.smartindent = true --Smart indent
opt.smarttab = true
opt.expandtab = true
opt.textwidth = 0
opt.autoindent = true
opt.cindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.showtabline = 2
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.laststatus = 3 -- Global statusline
opt.cmdheight = 1
opt.scrollback = 100000
opt.cursorline = true
opt.cursorcolumn = true
opt.pumheight = 20
opt.numberwidth = 3
g.compeleopt = "menu,menuone,noselct"

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

opt.path:remove "/usr/include"
opt.path:append "**"

opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd("syntax enable")

-- disable some builtin vim plugins
local disabled_built_ins = {
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
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

vim.schedule(function()
	vim.opt.shadafile = vim.fn.expand("$HOME") .. "/.local/share/nvim/shada/main.shada"
	vim.cmd([[ silent! rsh ]])
end)

vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])
