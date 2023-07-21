vim.o.autoindent = true
vim.o.autoread = true
vim.o.autowrite = true
vim.o.backspace = "indent,eol,start"
vim.o.backup = false
vim.o.backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"
vim.o.breakat = [[\ \	;:,!?]]
vim.o.breakindentopt = "shift:2,min:20"
vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 2 -- 0, 1,
vim.o.cmdwinheight = 5
vim.o.complete = ".,w,b,k"
vim.o.completeopt = "menuone,noselect"
vim.o.concealcursor = "niv"
vim.o.conceallevel = 0
vim.o.cursorcolumn = true
vim.o.cursorline = true
vim.o.diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience"
vim.o.display = "lastline"
vim.o.encoding = "utf-8"
vim.o.equalalways = false
vim.o.errorbells = true
vim.o.expandtab = true
vim.o.fileformats = "unix,mac,dos"
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.formatoptions = "1jcroql"
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --hidden --vimgrep --smart-case --"
vim.o.helpheight = 12
vim.o.hidden = true
vim.o.history = 2000
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
vim.o.incsearch = true
vim.o.infercase = true
vim.o.jumpoptions = "stack"
vim.o.laststatus = 2
vim.o.linebreak = true
vim.o.list = true
vim.o.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
vim.o.magic = true
vim.o.mousescroll = "ver:3,hor:6"
vim.o.number = true
vim.o.previewheight = 12
vim.o.pumheight = 15
vim.o.redrawtime = 1500
vim.o.relativenumber = true
vim.o.ruler = true
vim.o.scrolloff = 2
vim.o.sessionoptions = "buffers,curdir,help,tabpages,winsize"
vim.o.shada = "!,'500,<50,@100,s10,h"
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.o.shortmess = "aoOTIcF"
vim.o.showbreak = "↳  "
vim.o.showcmd = false
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.sidescrolloff = 5
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.splitbelow = true
vim.o.splitkeep = "cursor"
vim.o.splitright = true
vim.o.startofline = false
vim.o.swapfile = false
vim.o.switchbuf = "usetab,uselast"
vim.o.synmaxcol = 2500
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.ttimeout = true
vim.o.ttimeoutlen = 0
vim.o.undofile = true
-- Poease do NOT set `updatetime` to above 500, otherwise most plugins may not function correctl
vim.o.updatetime = 200
vim.o.viewoptions = "folds,cursor,curdir,slash,unix"
vim.o.virtualedit = "block"
vim.g.visualbell = true
vim.o.whichwrap = "h,l,<,>,[,],~"
vim.o.wildignore =
".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
vim.o.wildignorecase = true
vim.o.winminwidth = 10
vim.o.winwidth = 30
vim.o.wrap = false
vim.o.wrapscan = true
vim.o.writebackup = false
vim.g.mapleader = ","
