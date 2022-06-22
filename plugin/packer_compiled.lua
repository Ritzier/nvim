-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/rit/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/rit/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/rit/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/rit/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/rit/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["alpha-nvim"] = {
    config = { "\27LJ\2\nˆ\3\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\b\0\0I  ()_()     wW  Ww  (o)__(o)      _oo      wW  Ww    wWw     ()_()  I  (O o)     (O)(O)  (__  __)   >-(_  \\     (O)(O)    (O)_    (O o)  I   |^_\\      (..)     (  )        / _/      (..)     / __)    |^_\\  I   |(_))      ||       )(        / /         ||     / (       |(_)) I   |  /      _||_     (  )      / (         _||_   (  _)      |  /  I   )|\\\\     (_/\\_)     )/      (   `-.     (_/\\_)   \\ \\_      )|\\\\  I  (/  \\)              (         `--.._)              \\__)    (/  \\) ∆\2\0\0\r\0\19\0,6\0\0\0009\0\1\0006\2\2\0B\0\2\2\21\0\0\0006\1\3\0009\1\4\1'\3\5\0B\1\2\2'\2\6\0\18\3\0\0'\4\a\0'\5\b\0006\6\0\0009\6\t\6B\6\1\0029\6\n\6'\a\v\0006\b\0\0009\b\t\bB\b\1\0029\b\f\b'\t\v\0006\n\0\0009\n\t\nB\n\1\0029\n\r\n'\v\6\0\18\f\1\0&\2\f\0026\3\14\0'\5\15\0B\3\2\0026\4\16\0009\4\17\4\18\6\3\0B\6\1\2'\a\18\0B\4\3\2\18\5\2\0'\6\18\0\18\a\4\0&\5\a\5L\5\2\0\6\n\vconcat\ntable\18alpha.fortune\frequire\npatch\nminor\6.\nmajor\fversion\f  Ôîß v\r plugins\v  Ôòö \22%d-%m-%Y %H:%M:%S\tdate\aos\19packer_plugins\rtbl_keys\bvim∑\4\1\0\v\0\30\1I6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0AÄ6\2\1\0'\4\3\0B\2\2\0023\3\4\0009\4\5\0029\4\6\4\18\5\3\0B\5\1\2=\5\a\0049\4\5\0029\4\b\0044\5\4\0009\6\t\2'\b\n\0'\t\v\0'\n\f\0B\6\4\2>\6\1\0059\6\t\2'\b\r\0'\t\14\0'\n\15\0B\6\4\2>\6\2\0059\6\t\2'\b\16\0'\t\17\0'\n\18\0B\6\4\0?\6\0\0=\5\a\0043\4\19\0009\5\5\0029\5\20\5\18\6\4\0B\6\1\2=\6\a\0059\5\5\0029\5\20\0059\5\21\5'\6\23\0=\6\22\0059\5\5\0029\5\6\0059\5\21\5'\6\24\0=\6\22\0059\5\5\0029\5\b\0059\5\21\5'\6\25\0=\6\22\0059\5\5\0029\5\b\0059\5\21\5'\6\27\0=\6\26\0059\5\21\0029\5\21\5+\6\2\0=\6\28\0059\5\29\0019\a\21\2B\5\2\1K\0\1\0K\0\1\0\nsetup\14noautocmd\tType\16hl_shortcut\rFunction\fInclude\rConstant\ahl\topts\vfooter\0\f:qa<CR>\21Ôôô  Quit Neovim\6q\21:e $MYVIMRC <CR>\23Óòï  Configuration\6c :ene <BAR> startinsert <CR>\18ÔÖõ  New file\6e\vbutton\fbuttons\bval\vheader\fsection\0\27alpha.themes.dashboard\nalpha\frequire\npcall\aÄÄ¿ô\4\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n√\3\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\4\15text_align\vcenter\rfiletype\rNvimTree\ttext\18File Explorer\fpadding\3\1\1\0\14\22buffer_close_icon\bÔôï\vnumber\tnone\18modified_icon\b‚ú•\27always_show_bufferline\2\16diagnostics\rnvim_lsp\24show_tab_indicators\2\22show_buffer_icons\2\28show_buffer_close_icons\2\rtab_size\3\20\22max_prefix_length\3\r\20max_name_length\3\14\20separator_style\tthin\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\nsetup\15bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n≥\f\0\0\5\0\28\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\0025\3\26\0=\3\27\2B\0\2\1K\0\1\0\14diff_opts\1\0\1\rinternal\2\28current_line_blame_opts\1\0\2\21virtual_text_pos\beol\ndelay\3Ë\a\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3Ë\a\fkeymaps\tn [g\1\2\1\0@&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]g\1\2\1\0@&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\f\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\vbuffer\2\fnoremap\2\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\17v <leader>hrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\to ih2:<C-U>lua require\"gitsigns\".text_object()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\tx ih2:<C-U>lua require\"gitsigns\".text_object()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\17v <leader>hsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\nsigns\1\0\4\14word_diff\1\20update_debounce\3d\18sign_priority\3\6\23current_line_blame\2\17changedelete\1\0\4\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ttext\6~\ahl\19GitSignsChange\14topdelete\1\0\4\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ttext\b‚Äæ\ahl\19GitSignsDelete\vdelete\1\0\4\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ttext\6_\ahl\19GitSignsDelete\vchange\1\0\4\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ttext\b‚îÇ\ahl\19GitSignsChange\badd\1\0\0\1\0\4\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\ttext\b‚îÇ\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nÒ\4\0\0\4\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0'\2\f\0B\0\2\1K\0\1\0001autocmd CursorMoved * IndentBlanklineRefresh\bcmd\bvim\21context_patterns\1\15\0\0\nclass\rfunction\vmethod\nblock\17list_literal\rselector\b^if\v^table\17if_statement\nwhile\bfor\ttype\bvar\vimport\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\22\0\0\rstartify\14dashboard\16dotooagenda\blog\rfugitive\14gitcommit\vpacker\fvimwiki\rmarkdown\tjson\btxt\nvista\thelp\ftodoist\rNvimTree\rpeekaboo\bgit\20TelescopePrompt\rundotree\24flutterToolsOutline\5\1\0\5\25show_current_context\2\tchar\b‚îÇ\25space_char_blankline\6 \28show_first_indent_level\2#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["nightfox.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme duskfox\bcmd\bvim\0" },
    loaded = true,
    path = "/home/rit/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n¯\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14fast_wrap\1\0\0\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\tkeys\31qwertyuiopzxcvbnmasdfghjkl\bmap\n<M-e>\fend_key\6$\14highlight\vSearch\fpattern\23[%'%\"%)%>%]%)%}%,]\19highlight_grey\fComment\16check_comma\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/rit/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\nÿ\1\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\0016\1\6\0=\0\1\1K\0\1\0\bvim\nicons\1\0\5\tWARN\bÔî©\nERROR\bÔôô\nTRACE\b‚úé\nDEBUG\bÔÜà\tINFO\bÔ†µ\1\0\5\ftimeout\3–\15\18minimum_width\0032\22background_colour\vNormal\vstages\nslide\vrender\fdefault\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/rit/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n‰\n\0\0\b\0+\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\0035\4\v\0005\5\f\0005\6\r\0=\6\14\0055\6\15\0=\6\16\5=\5\17\4=\4\b\3=\3\18\0025\3\19\0=\3\20\0025\3\21\0004\4\0\0=\4\22\3=\3\23\0024\3\0\0=\3\24\0025\3\25\0005\4\26\0=\4\27\0034\4\0\0=\4\28\3=\3\29\0025\3\30\0005\4\31\0=\4 \0035\4!\0005\5\"\0005\6$\0005\a#\0=\a%\0065\a&\0=\a'\6=\6\28\5=\5(\4=\4)\3=\3*\2B\0\2\1K\0\1\0\factions\14open_file\18window_picker\fbuftype\1\4\0\0\vnofile\rterminal\thelp\rfiletype\1\0\0\1\a\0\0\vnotify\vpacker\aqf\tdiff\rfugitive\18fugitiveblame\1\0\2\nchars)ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\venable\2\1\0\2\18resize_window\1\17quit_on_open\1\15change_dir\1\0\2\vglobal\1\venable\2\1\0\1\25use_system_clipboard\2\ffilters\fexclude\vcustom\1\2\0\0\14.DS_Store\1\0\1\rdotfiles\1\23ignore_ft_on_setup\24update_focused_file\16ignore_list\1\0\2\15update_cwd\2\venable\2\23hijack_directories\1\0\2\14auto_open\2\venable\2\rrenderer\vglyphs\vfolder\1\0\b\nempty\bÔÑî\17arrow_closed\5\topen\bÔÅº\15empty_open\bÔÑï\fdefault\bÔÅª\15arrow_open\5\fsymlink\bÔíÇ\17symlink_open\bÓóæ\bgit\1\0\a\runmerged\bÔ¨´\14untracked\bÔ≤â\vstaged\bÔëó\fdeleted\bÔëò\runstaged\bÔëô\fignored\bÔë¥\frenamed\bÔëö\1\0\2\fdefault\bÔí•\fsymlink\bÔíÅ\1\0\2\18symlink_arrow\n Ôïì \fpadding\6 \19indent_markers\1\0\1\25root_folder_modifier\a:e\nicons\1\0\3\tnone\a  \tedge\t‚îÇ \vcorner\t‚îî \1\0\1\venable\2\tview\1\0\b\nwidth\3\30\21hide_root_folder\1\19relativenumber\1\15signcolumn\byes\vnumber\1 preserve_window_proportions\1\tside\tleft\vheight\3\30\1\0\f\18disable_netrw\1\17hijack_netrw\2\15update_cwd\2\fsort_by\tname\16open_on_tab\1\23open_on_setup_file\1\18open_on_setup\1\27ignore_buffer_on_setup\1'hijack_unnamed_buffer_when_opening\1\18hijack_cursor\2\25auto_reload_on_write\2\20respect_buf_cwd\2\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-endwise", "nvim-ts-rainbow", "nvim-treesitter-textsubjects", "nvim-treesitter-textobjects", "nvim-ts-context-commentstring" },
    config = { "\27LJ\2\n£\t\0\0\6\0.\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0005\4\17\0=\4\n\3=\3\18\0025\3\21\0005\4\19\0005\5\20\0=\5\n\4=\4\22\0035\4\23\0005\5\24\0=\5\25\0045\5\26\0=\5\27\4=\4\28\0035\4\29\0005\5\30\0=\5\31\0045\5 \0=\5!\0045\5\"\0=\5#\0045\5$\0=\5%\4=\4&\3=\3'\0025\3(\0=\3)\0025\3*\0=\3+\0025\3,\0=\3-\2B\0\2\1K\0\1\0\26context_commentstring\1\0\2\19enable_autocmd\1\venable\2\fautotag\1\0\1\venable\2\fendwise\1\0\1\venable\2\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]]\17@class.outer\a]m\20@function.outer\1\0\2\14set_jumps\2\venable\2\tswap\18swap_previous\1\0\1\15<leader>cX\21@parameter.inner\14swap_next\1\0\1\15<leader>cx\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\1\0\4\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\aif\20@function.inner\1\0\2\14lookahead\2\venable\2\17textsubjects\1\0\3\6;!textsubjects-container-outer\6.\23textsubjects-smart\ai;!textsubjects-container-inner\1\0\2\19prev_selection\6,\venable\2\fmatchup\1\0\1\venable\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\bgrn\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\1\0\1\venable\2\frainbow\1\0\2\18extended_mode\2\venable\2\14highlight\1\0\1\venable\2\1\0\2\21ensure_installed\ball\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag",
    wants = { "nvim-treesitter" }
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/rit/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/rit/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/rit/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  undotree = {
    commands = { "UndoTreeToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rit/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\nÿ\1\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\0016\1\6\0=\0\1\1K\0\1\0\bvim\nicons\1\0\5\tWARN\bÔî©\nERROR\bÔôô\nTRACE\b‚úé\nDEBUG\bÔÜà\tINFO\bÔ†µ\1\0\5\ftimeout\3–\15\18minimum_width\0032\22background_colour\vNormal\vstages\nslide\vrender\fdefault\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: nightfox.nvim
time([[Config for nightfox.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme duskfox\bcmd\bvim\0", "config", "nightfox.nvim")
time([[Config for nightfox.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n¯\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14fast_wrap\1\0\0\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\tkeys\31qwertyuiopzxcvbnmasdfghjkl\bmap\n<M-e>\fend_key\6$\14highlight\vSearch\fpattern\23[%'%\"%)%>%]%)%}%,]\19highlight_grey\fComment\16check_comma\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndoTreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndoTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'gitsigns.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-ts-rainbow', 'nvim-treesitter-textsubjects', 'nvim-treesitter-textobjects', 'nvim-ts-context-commentstring', 'nvim-treesitter'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-ts-autotag', 'nvim-treesitter-endwise'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'fidget.nvim', 'gitsigns.nvim', 'bufferline.nvim', 'indent-blankline.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'alpha-nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles(0) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
