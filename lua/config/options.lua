local global_local = {
	-- backupdir = global.cache_dir .. "backup/",
	-- directory = global.cache_dir .. "swap/",
	-- spellfile = global.cache_dir .. "spell/en.uft-8.add",
	-- viewdir = global.cache_dir .. "view/",
	autoindent = true,
	autoread = true,
	autowrite = true,
	backspace = "indent,eol,start",
	backup = false,
	backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
	breakat = [[\ \	;:,!?]],
	breakindentopt = "shift:2,min:20",
	clipboard = "unnamedplus",
	cmdheight = 1, -- 0, 1, 2
	cmdwinheight = 5,
	complete = ".,w,b,k",
	completeopt = "menuone,noselect",
	concealcursor = "niv",
	conceallevel = 0,
	cursorcolumn = true,
	cursorline = true,
	diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience",
	display = "lastline",
	encoding = "utf-8",
	equalalways = false,
	errorbells = true,
	expandtab = true,
	fileformats = "unix,mac,dos",
	foldcolumn = "1",
	foldenable = true,
	foldlevel = 99,
	foldlevelstart = 99,
	foldmethod = "manual",
	formatoptions = "1jcroql",
	-- formatoptions -= "cro",
	grepformat = "%f:%l:%c:%m",
	grepprg = "rg --hidden --vimgrep --smart-case --",
	helpheight = 12,
	hidden = true,
	history = 2000,
	ignorecase = true,
	inccommand = "nosplit",
	incsearch = true,
	infercase = true,
	jumpoptions = "stack",
	laststatus = 2,
	linebreak = true,
	list = true,
	listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
	magic = true,
	mousescroll = "ver:3,hor:6",
	number = true,
	previewheight = 12,
	-- Do NOT adjust the following option (pumblend) if you're using transparent background
	pumblend = 0,
	pumheight = 15,
	redrawtime = 1500,
	relativenumber = true,
	ruler = true,
	scrolloff = 8,
	sessionoptions = "buffers,curdir,folds,help,tabpages,winpos,winsize",
	shada = "!,'500,<50,@100,s10,h",
	shiftround = true,
	shiftwidth = 4,
	shortmess = "aoOTIcF",
	showbreak = "↳  ",
	showcmd = false,
	showmode = false,
	showtabline = 2,
	sidescrolloff = 10,
	signcolumn = "yes",
	smartcase = true,
	smarttab = true,
	softtabstop = 4,
	splitbelow = true,
	splitkeep = "screen",
	splitright = true,
	startofline = false,
	swapfile = false,
	switchbuf = "usetab,uselast",
	synmaxcol = 2500,
	tabstop = 4,
	termguicolors = true,
	timeout = true,
	timeoutlen = 300,
	ttimeout = true,
	ttimeoutlen = 0,
	undofile = true,
	-- Please do NOT set `updatetime` to above 500, otherwise most plugins may not function correctly
	updatetime = 50,
	viewoptions = "folds,cursor,curdir,slash,unix",
	virtualedit = "block",
	visualbell = true,
	whichwrap = "h,l,<,>,[,],~",
	wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
	wildignorecase = true,
	-- Do NOT adjust the following option (winblend) if you're using transparent background
	winblend = 0,
	winminwidth = 10,
	winwidth = 30,
	wrap = false,
	wrapscan = true,
	writebackup = false,
}

local function isempty(s)
	return s == nil or s == ""
end
local function use_if_defined(val, fallback)
	return val ~= nil and val or fallback
end

-- -- custom python provider
-- local conda_prefix = os.getenv("CONDA_PREFIX")
-- if not isempty(conda_prefix) then
-- 	vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, conda_prefix .. "/bin/python")
-- 	vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, conda_prefix .. "/bin/python")
-- else
-- 	vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, "python")
-- 	vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, "python3")
-- end

vim.g.python_host_prog = "/home/ritzier/python312/bin/python"
vim.g.python3_host_prog = "/home/ritzier/python312/bin/python"

-- custom sqlite3 provider
local sqlite_clib_path = os.getenv("SQLITE_CLIB_PATH")
if not isempty(sqlite_clib_path) then
	-- Try environment variable first
	vim.g.sqlite_clib_path = sqlite_clib_path
end

for name, value in pairs(global_local) do
	vim.o[name] = value
end

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.o.guifont = "JetBrainsMono Nerd Font:h8"

if vim.g.neovide then
	vim.g.neovide_text_gamma = 0.0
	vim.g.neovide_text_contrast = 0.5
	vim.g.no_idle = true
	vim.g.neovide_refresh_rate_idle = 1
	vim.g.refresh_rate = 165
	vim.g.cursor_vfx_mode = "torpedo"
	vim.g.cursor_vfx_opacity = 200.0
	vim.g.cursor_antialiasing = true
	vim.g.cursor_trail_length = 0.05
	vim.g.cursor_animation_length = 0.03
	vim.g.cursor_vfx_particle_speed = 20.0
	vim.g.cursor_vfx_particle_density = 5.0
	vim.g.cursor_vfx_particle_lifetime = 1.2

	vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
	vim.keymap.set("v", "<D-c>", '"+y') -- Copy
	vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end
