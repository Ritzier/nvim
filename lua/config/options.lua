local opt = vim.opt

opt.autoindent = true
opt.breakindent = true
opt.clipboard = "unnamedplus"
opt.cmdheight = 0
opt.completeopt = "menuone,noselect"
opt.conceallevel = 0
-- opt.listchars = "tab:|·,nbsp:+,trail:·,extends:→,precedes:←"
opt.confirm = true
opt.cursorline = true
opt.cursorcolumn = true
opt.expandtab = true
opt.backspace = "indent,eol,start"
opt.foldcolumn = "0"
opt.foldenable = false
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.formatoptions = "jqlnt"
opt.hidden = true
opt.hlsearch = true
opt.incsearch = true
opt.magic = true
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.joinspaces = false
opt.laststatus = 3
opt.list = true
vim.opt.listchars = { eol = "↵" }
vim.opt.list = true
opt.mouse = "a"
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.scrollback = 100000
opt.scrolloff = 9
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess:append({ w = true, I = true, c = true, C = true })
opt.showcmd = false
opt.showmode = false
opt.sidescrolloff = 9

opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 300
opt.title = true
opt.undofile = true
opt.updatetime = 200
opt.wildmode = "longest:full,full"

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.g.markdown_recommended_style = 0

local opt = vim.opt
local cmd = vim.cmd
local api = vim.api
local nvim_create_autocmd = api.nvim_create_autocmd
local nvim_set_hl = api.nvim_set_hl

opt.list = true

local space = "·"
opt.listchars:append {
	tab = "│─",
	multispace = space,
	lead = space,
	trail = space,
	nbsp = space
}

cmd([[match TrailingWhitespace /\s\+$/]])

nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })

nvim_create_autocmd("InsertEnter", {
	callback = function()
		opt.listchars.trail = nil
		nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
	end
})

nvim_create_autocmd("InsertLeave", {
	callback = function()
		opt.listchars.trail = space
		nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
	end
})
