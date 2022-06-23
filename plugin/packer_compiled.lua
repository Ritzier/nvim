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
local package_path_str = "/home/ritzier/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ritzier/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ritzier/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ritzier/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ritzier/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["Comment.nvim"] = {
    after_files = { "/home/ritzier/.local/share/nvim/site/pack/packer/opt/Comment.nvim/after/plugin/Comment.lua" },
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    keys = { { "", "gc" }, { "", "gb" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    after = { "cmp_luasnip" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vaerial\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\nˆ\3\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\b\0\0I  ()_()     wW  Ww  (o)__(o)      _oo      wW  Ww    wWw     ()_()  I  (O o)     (O)(O)  (__  __)   >-(_  \\     (O)(O)    (O)_    (O o)  I   |^_\\      (..)     (  )        / _/      (..)     / __)    |^_\\  I   |(_))      ||       )(        / /         ||     / (       |(_)) I   |  /      _||_     (  )      / (         _||_   (  _)      |  /  I   )|\\\\     (_/\\_)     )/      (   `-.     (_/\\_)   \\ \\_      )|\\\\  I  (/  \\)              (         `--.._)              \\__)    (/  \\) ∆\2\0\0\r\0\19\0,6\0\0\0009\0\1\0006\2\2\0B\0\2\2\21\0\0\0006\1\3\0009\1\4\1'\3\5\0B\1\2\2'\2\6\0\18\3\0\0'\4\a\0'\5\b\0006\6\0\0009\6\t\6B\6\1\0029\6\n\6'\a\v\0006\b\0\0009\b\t\bB\b\1\0029\b\f\b'\t\v\0006\n\0\0009\n\t\nB\n\1\0029\n\r\n'\v\6\0\18\f\1\0&\2\f\0026\3\14\0'\5\15\0B\3\2\0026\4\16\0009\4\17\4\18\6\3\0B\6\1\2'\a\18\0B\4\3\2\18\5\2\0'\6\18\0\18\a\4\0&\5\a\5L\5\2\0\6\n\vconcat\ntable\18alpha.fortune\frequire\npatch\nminor\6.\nmajor\fversion\f  Ôîß v\r plugins\v  Ôòö \22%d-%m-%Y %H:%M:%S\tdate\aos\19packer_plugins\rtbl_keys\bvim∑\4\1\0\v\0\30\1I6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0AÄ6\2\1\0'\4\3\0B\2\2\0023\3\4\0009\4\5\0029\4\6\4\18\5\3\0B\5\1\2=\5\a\0049\4\5\0029\4\b\0044\5\4\0009\6\t\2'\b\n\0'\t\v\0'\n\f\0B\6\4\2>\6\1\0059\6\t\2'\b\r\0'\t\14\0'\n\15\0B\6\4\2>\6\2\0059\6\t\2'\b\16\0'\t\17\0'\n\18\0B\6\4\0?\6\0\0=\5\a\0043\4\19\0009\5\5\0029\5\20\5\18\6\4\0B\6\1\2=\6\a\0059\5\5\0029\5\20\0059\5\21\5'\6\23\0=\6\22\0059\5\5\0029\5\6\0059\5\21\5'\6\24\0=\6\22\0059\5\5\0029\5\b\0059\5\21\5'\6\25\0=\6\22\0059\5\5\0029\5\b\0059\5\21\5'\6\27\0=\6\26\0059\5\21\0029\5\21\5+\6\2\0=\6\28\0059\5\29\0019\a\21\2B\5\2\1K\0\1\0K\0\1\0\nsetup\14noautocmd\tType\16hl_shortcut\rFunction\fInclude\rConstant\ahl\topts\vfooter\0\f:qa<CR>\21Ôôô  Quit Neovim\6q\21:e $MYVIMRC <CR>\23Óòï  Configuration\6c :ene <BAR> startinsert <CR>\18ÔÖõ  New file\6e\vbutton\fbuttons\bval\vheader\fsection\0\27alpha.themes.dashboard\nalpha\frequire\npcall\aÄÄ¿ô\4\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n√\3\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\4\ttext\18File Explorer\15text_align\vcenter\fpadding\3\1\rfiletype\rNvimTree\1\0\14\16diagnostics\rnvim_lsp\18modified_icon\b‚ú•\vnumber\tnone\27always_show_bufferline\2\24show_tab_indicators\2\22show_buffer_icons\2\28show_buffer_close_icons\2\rtab_size\3\20\22max_prefix_length\3\r\20max_name_length\3\14\20separator_style\tthin\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\22buffer_close_icon\bÔôï\nsetup\15bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    after = { "cmp-latex-symbols" },
    after_files = { "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["cmp-spell"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-latex-symbols"] = {
    after_files = { "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols/after/plugin/cmp_latex.lua" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols",
    url = "https://github.com/kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    after = { "cmp-nvim-lua" },
    after_files = { "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      cmp_luasnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after = { "cmp-tmux" },
    after_files = { "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after = { "cmp-spell" },
    after_files = { "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["cmp-tmux"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    after = { "cmp-buffer" },
    after_files = { "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-spell/after/plugin/cmp-spell.lua" },
    load_after = {
      ["cmp-path"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-tmux"] = {
    after = { "cmp-path" },
    after_files = { "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-tmux/after/plugin/cmp_tmux.vim" },
    load_after = {
      ["cmp-nvim-lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux"
  },
  ["cmp-under-comparator"] = {
    loaded = true,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/start/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    after = { "cmp-nvim-lsp" },
    after_files = { "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      LuaSnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["efmls-configs-nvim"] = {
    loaded = true,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/start/efmls-configs-nvim",
    url = "https://github.com/creativenull/efmls-configs-nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n≥\f\0\0\5\0\28\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\0025\3\26\0=\3\27\2B\0\2\1K\0\1\0\14diff_opts\1\0\1\rinternal\2\28current_line_blame_opts\1\0\2\21virtual_text_pos\beol\ndelay\3Ë\a\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3Ë\a\fkeymaps\tn [g\1\2\1\0@&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]g\1\2\1\0@&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\f\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\vbuffer\2\fnoremap\2\to ih2:<C-U>lua require\"gitsigns\".text_object()<CR>\17v <leader>hrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\tx ih2:<C-U>lua require\"gitsigns\".text_object()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\17v <leader>hsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\nsigns\1\0\4\14word_diff\1\20update_debounce\3d\18sign_priority\3\6\23current_line_blame\2\17changedelete\1\0\4\ttext\6~\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b‚Äæ\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b‚îÇ\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\b‚îÇ\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nÒ\4\0\0\4\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0'\2\f\0B\0\2\1K\0\1\0001autocmd CursorMoved * IndentBlanklineRefresh\bcmd\bvim\21context_patterns\1\15\0\0\nclass\rfunction\vmethod\nblock\17list_literal\rselector\b^if\v^table\17if_statement\nwhile\bfor\ttype\bvar\vimport\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\22\0\0\rstartify\14dashboard\16dotooagenda\blog\rfugitive\14gitcommit\vpacker\fvimwiki\rmarkdown\tjson\btxt\nvista\thelp\ftodoist\rNvimTree\rpeekaboo\bgit\20TelescopePrompt\rundotree\24flutterToolsOutline\5\1\0\5\25show_current_context\2\25space_char_blankline\6 \tchar\b‚îÇ\28show_first_indent_level\2#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nT\0\0\2\1\3\0\f-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0D\0\1\0X\0\2Ä'\0\2\0L\0\2\0K\0\1\0\0¿\5\17get_location\17is_availablel\0\1\t\0\5\0\0186\1\0\0009\1\1\1\18\3\0\0'\4\2\0B\1\3\2\15\0\1\0X\2\nÄ\18\1\0\0\18\4\0\0009\2\3\0'\5\4\0B\2\3\4X\5\1Ä\18\1\5\0E\5\3\2R\5˝\18\0\1\0L\0\2\0\f([^/]+)\vgmatch\6/\tfind\vstringÒ\1\1\0\b\0\r\0&3\0\0\0006\1\1\0009\1\2\0019\1\3\1\a\1\4\0X\1\29Ä6\1\5\0009\1\6\1'\3\a\0B\1\2\2\15\0\1\0X\2\bÄ6\2\b\0009\2\t\2'\4\n\0\18\5\0\0\18\a\1\0B\5\2\0002\0\0ÄC\2\1\0006\2\5\0009\2\6\2'\4\v\0B\2\2\2\18\1\2\0\15\0\1\0X\2\bÄ6\2\b\0009\2\t\2'\4\n\0\18\5\0\0\18\a\1\0B\5\2\0002\0\0ÄC\2\1\0'\1\f\0002\0\0ÄL\1\2\0\5\16VIRTUAL_ENV\a%s\vformat\vstring\22CONDA_DEFAULT_ENV\vgetenv\aos\vpython\rfiletype\abo\bvim\0¸\t\1\0\17\0<\0Ä\0016\0\0\0'\2\1\0B\0\2\0023\1\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\0024\3\0\0=\3\6\0024\3\0\0=\3\a\0024\3\0\0=\3\b\0025\3\t\0=\3\n\0025\3\f\0005\4\v\0=\4\4\0035\4\r\0=\4\5\0034\4\0\0=\4\6\0034\4\0\0=\4\a\0034\4\0\0=\4\b\0035\4\14\0=\4\n\0035\4\15\0=\2\16\0045\5\17\0=\5\18\0045\5\19\0=\3\16\0055\6\20\0=\6\18\0055\6\21\0=\3\16\0065\a\22\0=\a\18\0065\a\23\0=\3\16\a5\b\24\0=\b\18\a5\b\25\0=\3\16\b5\t\26\0=\t\18\b3\t\27\0006\n\0\0'\f\28\0B\n\2\0029\n\29\n5\f\"\0005\r\30\0004\14\0\0=\14\31\r5\14 \0=\14!\r=\r#\f5\r%\0005\14$\0=\14\4\r4\14\3\0005\15&\0>\15\1\0145\15'\0>\15\2\14=\14\5\r4\14\3\0005\15)\0>\1\1\0159\16(\0=\16*\15>\15\1\14=\14\6\r4\14\3\0005\15+\0005\16,\0=\16-\0155\16.\0=\16/\15>\15\1\14=\14\a\r4\14\5\0005\0150\0>\15\1\0144\15\3\0>\t\1\15>\15\2\0145\0151\0>\15\3\0145\0152\0005\0163\0=\16/\15>\15\4\14=\14\b\r5\0144\0=\14\n\r=\r\16\f5\r5\0004\14\0\0=\14\4\r4\14\0\0=\14\5\r5\0146\0=\14\6\r5\0147\0=\14\a\r4\14\0\0=\14\b\r4\14\0\0=\14\n\r=\r8\f4\r\0\0=\r9\f5\r:\0>\4\5\r>\5\6\r>\6\a\r>\a\b\r>\b\t\r=\r;\fB\n\2\0012\0\0ÄK\0\1\0\15extensions\1\5\0\0\rquickfix\14nvim-tree\15toggleterm\rfugitive\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\1\3\0\0\rprogress\rlocation\1\0\3\bdos\tCRLF\tunix\aLF\bmac\aCR\1\2\1\0\15fileformat\18icons_enabled\2\1\2\0\0\rencoding\1\2\2\0\rfiletype\fcolored\2\14icon_only\2\fsymbols\1\0\3\nerror\tÔÅó \tinfo\tÔÅ™ \twarn\tÔÅ± \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\tcond\1\0\0\17is_available\1\2\0\0\tdiff\1\2\0\0\vbranch\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23section_separators\1\0\2\tleft\5\nright\5\23disabled_filetypes\1\0\3\ntheme\tauto\18icons_enabled\2\25component_separators\6|\nsetup\flualine\0\1\2\0\0\18dapui_watches\1\0\0\1\2\0\0\17dapui_stacks\1\0\0\1\2\0\0\22dapui_breakpoints\1\0\0\1\2\0\0\17dapui_scopes\1\0\0\14filetypes\1\2\0\0\vaerial\rsections\1\0\0\1\2\0\0\rlocation\1\2\0\0\rfiletype\1\0\0\1\2\0\0\tmode\14lualine_z\1\2\0\0\rlocation\14lualine_y\14lualine_x\14lualine_c\14lualine_b\14lualine_a\1\0\0\0\rnvim-gps\frequire\0" },
    load_after = {
      ["nvim-gps"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["nightfox.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme duskfox\bcmd\bvim\0" },
    loaded = true,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n¯\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14fast_wrap\1\0\0\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\14highlight\vSearch\16check_comma\2\tkeys\31qwertyuiopzxcvbnmasdfghjkl\bmap\n<M-e>\fend_key\6$\19highlight_grey\fComment\fpattern\23[%'%\"%)%>%]%)%}%,]\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs",
    wants = { "nvim-treesitter" }
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\n£\1\0\2\t\0\a\1\24+\2\2\0006\3\0\0009\3\1\0039\3\2\3\18\5\0\0B\3\2\0026\4\0\0009\4\3\0049\4\4\4\18\6\3\0B\4\2\2*\5\0\0\1\5\4\0X\5\2Ä+\2\1\0X\5\aÄ\18\a\3\0009\5\5\3'\b\6\0B\5\3\2\15\0\5\0X\6\1Ä+\2\1\0L\2\2\0\17^fugitive://\nmatch\rgetfsize\afn\22nvim_buf_get_name\bapi\bvimÄ¿\fΩ\4\1\0\6\0\23\0\0276\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0005\3\a\0005\4\b\0=\4\t\0033\4\n\0=\4\v\3=\3\f\0025\3\r\0=\3\14\0025\3\20\0005\4\16\0005\5\15\0=\5\17\0045\5\18\0=\5\19\4=\4\21\3=\3\22\2B\0\2\1K\0\1\0\vfilter\bfzf\1\0\0\15extra_opts\1\5\0\0\v--bind\22ctrl-o:toggle-all\r--prompt\a> \15action_for\1\0\0\1\0\2\vctrl-t\rtab drop\vctrl-s\nsplit\rfunc_map\1\0\6\nopenc\6O\tdrop\6o\16ptogglemode\az,\ttabc\5\nsplit\n<C-s>\ftabdrop\n<C-t>\fpreview\22should_preview_cb\0\17border_chars\1\n\0\0\b‚îÉ\b‚îÉ\b‚îÅ\b‚îÅ\b‚îè\b‚îì\b‚îó\b‚îõ\b‚ñà\1\0\3\17delay_syntax\3P\16win_vheight\3\f\15win_height\3\f\1\0\2\23auto_resize_height\2\16auto_enable\2\nsetup\bbqf\frequireY    hi BqfPreviewBorder guifg=#F2CDCD ctermfg=71\n    hi link BqfPreviewRange Search\n\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    after = { "LuaSnip" },
    config = { "\27LJ\2\nF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvim–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2Ø\1\0\1\3\0\b\0\0264\1\t\0005\2\0\0>\0\2\2>\2\1\0015\2\1\0>\0\2\2>\2\2\0015\2\2\0>\0\2\2>\2\3\0015\2\3\0>\0\2\2>\2\4\0015\2\4\0>\0\2\2>\2\5\0015\2\5\0>\0\2\2>\2\6\0015\2\6\0>\0\2\2>\2\a\0015\2\a\0>\0\2\2>\2\b\1L\1\2\0\1\2\0\0\b‚îÇ\1\2\0\0\b‚ï∞\1\2\0\0\b‚îÄ\1\2\0\0\b‚ïØ\1\2\0\0\b‚îÇ\1\2\0\0\b‚ïÆ\1\2\0\0\b‚îÄ\1\2\0\0\b‚ï≠\15\0\1\2\0\0\0\2+\1\1\0L\1\2\0â\4\0\2\b\0\t\0\0155\2\0\0006\3\2\0009\3\3\3'\5\4\0009\6\1\0018\6\6\0029\a\1\1B\3\4\2=\3\1\0015\3\6\0009\4\a\0009\4\b\0048\3\4\3=\3\5\1L\1\2\0\tname\vsource\1\0\b\ttmux\v[TMUX]\fluasnip\v[SNIP]\nspell\f[SPELL]\rnvim_lua\n[LUA]\rnvim_lsp\n[LSP]\tpath\v[PATH]\forgmode\n[ORG]\vbuffer\n[BUF]\tmenu\n%s %s\vformat\vstring\tkind\1\0\25\vStruct\bÔÜ≥\nValue\bÔ¢ü\15EnumMember\bÔÖù\rFunction\bÔûî\nField\bÔõº\rConstant\bÔ£æ\vMethod\bÔö¶\tUnit\bÓàü\nClass\bÔ¥Ø\rProperty\bÔ∞†\tEnum\bÔÖù\nEvent\bÔÉß\18TypeParameter\bÔô±\tText\bÓòí\vModule\bÔíá\tFile\bÔúò\rVariable\bÔñ†\vFolder\bÔùä\14Reference\bÔíÅ\14Interface\bÔÉ®\nColor\bÔ£ó\rOperator\bÔöî\fSnippet\bÔëè\16Constructor\bÔê£\fKeyword\bÔ†ä}\0\1\3\2\3\0\20-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\nÄ-\1\1\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\2\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\5¿\1¿\rcomplete\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\5¿\21select_prev_item\fvisibleõ\1\0\1\6\1\b\0\0206\1\0\0'\3\1\0B\1\2\0029\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\tÄ6\1\3\0009\1\4\0019\1\5\1-\3\0\0'\5\6\0B\3\2\2'\4\a\0B\1\3\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\5\28<Plug>luasnip-jump-prev\rfeedkeys\afn\bvim\rjumpable\fluasnip\frequire¶\1\0\1\6\1\b\0\0196\1\0\0'\3\1\0B\1\2\0029\1\2\1B\1\1\2\15\0\1\0X\2\tÄ6\1\3\0009\1\4\0019\1\5\1-\3\0\0'\5\6\0B\3\2\2'\4\a\0B\1\3\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\5!<Plug>luasnip-expand-or-jump\rfeedkeys\afn\bvim\23expand_or_jumpable\fluasnip\frequireC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireÀ\b\1\0\16\0I\0~3\0\0\0003\1\1\0003\2\2\0006\3\3\0'\5\4\0B\3\2\0023\4\6\0=\4\5\0036\4\3\0'\6\a\0B\4\2\0026\5\3\0'\a\b\0B\5\2\0029\6\t\0055\b\18\0005\t\r\0005\n\v\0\18\v\2\0'\r\n\0B\v\2\2=\v\f\n=\n\14\t5\n\16\0\18\v\2\0'\r\15\0B\v\2\2=\v\f\n=\n\17\t=\t\19\b5\t\29\0004\n\t\0009\v\20\4>\v\1\n9\v\21\4>\v\2\n9\v\22\4>\v\3\n6\v\3\0'\r\23\0B\v\2\0029\v\24\v>\v\4\n9\v\25\4>\v\5\n9\v\26\4>\v\6\n9\v\27\4>\v\a\n9\v\28\4>\v\b\n=\n\30\t=\t\31\b5\t!\0003\n \0=\n\"\t=\t#\b9\t$\0059\t%\t9\t&\t5\v(\0009\f$\0059\f'\fB\f\1\2=\f)\v9\f$\0059\f*\fB\f\1\2=\f+\v9\f$\0059\f,\f)\14¸ˇB\f\2\2=\f-\v9\f$\0059\f,\f)\14\4\0B\f\2\2=\f.\v9\f$\0059\f/\fB\f\1\2=\f0\v9\f$\0053\0141\0005\0152\0B\f\3\2=\f3\v9\f$\0053\0144\0005\0155\0B\f\3\2=\f6\v3\f7\0=\f8\v3\f9\0=\f:\vB\t\2\2=\t$\b5\t<\0003\n;\0=\n=\t=\t>\b4\t\n\0005\n?\0>\n\1\t5\n@\0>\n\2\t5\nA\0>\n\3\t5\nB\0>\n\4\t5\nC\0>\n\5\t5\nD\0>\n\6\t5\nE\0>\n\a\t5\nF\0>\n\b\t5\nG\0>\n\t\t=\tH\bB\6\2\0012\0\0ÄK\0\1\0\fsources\1\0\1\tname\18latex_symbols\1\0\1\tname\vbuffer\1\0\1\tname\forgmode\1\0\1\tname\ttmux\1\0\1\tname\nspell\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\fsnippet\vexpand\1\0\0\0\n<C-l>\0\n<C-h>\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-e>\nclose\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\vinsert\vpreset\fmapping\15formatting\vformat\1\0\0\0\fsorting\16comparators\1\0\0\norder\vlength\14sort_text\tkind\nunder\25cmp-under-comparator\nscore\nexact\voffset\vwindow\1\0\0\18documentation\1\0\0\17CmpDocBorder\15completion\1\0\0\vborder\1\0\0\14CmpBorder\nsetup\bcmp\23cmp.config.compare\0\18has_scrollbar\21cmp.utils.window\frequire\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n^\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireO\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\thook\1\0\0\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-gps"] = {
    after = { "lualine.nvim" },
    config = { "\27LJ\2\nî\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14languages\1\0\17\bphp\2\6c\2\tyaml\2\15typescript\2\ttoml\2\tscss\2\trust\2\truby\2\blua\2\15javascript\2\tjava\2\thtml\2\fc_sharp\2\bcpp\2\tbash\2\ago\2\vpython\2\nicons\1\0\1\14separator\b > \1\0\3\18function-name\tÔûî \16method-name\tÔö¶ \15class-name\tÔ†ñ \nsetup\rnvim-gps\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\ns\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_signature.nvim", "lspsaga.nvim", "aerial.nvim", "nvim-lightbulb" },
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26config.completion.lsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\nÿ\1\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\0016\1\6\0=\0\1\1K\0\1\0\bvim\nicons\1\0\5\nTRACE\b‚úé\nDEBUG\bÔÜà\tINFO\bÔ†µ\nERROR\bÔôô\tWARN\bÔî©\1\0\5\18minimum_width\0032\22background_colour\vNormal\ftimeout\3–\15\vrender\fdefault\vstages\nslide\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n‰\n\0\0\b\0+\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\0035\4\v\0005\5\f\0005\6\r\0=\6\14\0055\6\15\0=\6\16\5=\5\17\4=\4\b\3=\3\18\0025\3\19\0=\3\20\0025\3\21\0004\4\0\0=\4\22\3=\3\23\0024\3\0\0=\3\24\0025\3\25\0005\4\26\0=\4\27\0034\4\0\0=\4\28\3=\3\29\0025\3\30\0005\4\31\0=\4 \0035\4!\0005\5\"\0005\6$\0005\a#\0=\a%\0065\a&\0=\a'\6=\6\28\5=\5(\4=\4)\3=\3*\2B\0\2\1K\0\1\0\factions\14open_file\18window_picker\fbuftype\1\4\0\0\vnofile\rterminal\thelp\rfiletype\1\0\0\1\a\0\0\vnotify\vpacker\aqf\tdiff\rfugitive\18fugitiveblame\1\0\2\venable\2\nchars)ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\1\0\2\18resize_window\1\17quit_on_open\1\15change_dir\1\0\2\vglobal\1\venable\2\1\0\1\25use_system_clipboard\2\ffilters\fexclude\vcustom\1\2\0\0\14.DS_Store\1\0\1\rdotfiles\1\23ignore_ft_on_setup\24update_focused_file\16ignore_list\1\0\2\venable\2\15update_cwd\2\23hijack_directories\1\0\2\14auto_open\2\venable\2\rrenderer\vglyphs\vfolder\1\0\b\topen\bÔÅº\15arrow_open\5\nempty\bÔÑî\17arrow_closed\5\15empty_open\bÔÑï\fdefault\bÔÅª\fsymlink\bÔíÇ\17symlink_open\bÓóæ\bgit\1\0\a\runstaged\bÔëô\14untracked\bÔ≤â\frenamed\bÔëö\fdeleted\bÔëò\runmerged\bÔ¨´\fignored\bÔë¥\vstaged\bÔëó\1\0\2\fdefault\bÔí•\fsymlink\bÔíÅ\1\0\2\18symlink_arrow\n Ôïì \fpadding\6 \19indent_markers\1\0\1\25root_folder_modifier\a:e\nicons\1\0\3\tnone\a  \tedge\t‚îÇ \vcorner\t‚îî \1\0\1\venable\2\tview\1\0\b\19relativenumber\1\15signcolumn\byes\vnumber\1\21hide_root_folder\1 preserve_window_proportions\1\tside\tleft\vheight\3\30\nwidth\3\30\1\0\f\17hijack_netrw\2\18hijack_cursor\2\18disable_netrw\1\25auto_reload_on_write\2\20respect_buf_cwd\2\15update_cwd\2\fsort_by\tname\16open_on_tab\1\23open_on_setup_file\1\18open_on_setup\1\27ignore_buffer_on_setup\1'hijack_unnamed_buffer_when_opening\1\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-gps", "nvim-treesitter-textobjects", "nvim-treesitter-textsubjects", "nvim-ts-context-commentstring", "nvim-treesitter-endwise", "nvim-ts-rainbow" },
    config = { "\27LJ\2\n£\t\0\0\6\0.\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0005\4\17\0=\4\n\3=\3\18\0025\3\21\0005\4\19\0005\5\20\0=\5\n\4=\4\22\0035\4\23\0005\5\24\0=\5\25\0045\5\26\0=\5\27\4=\4\28\0035\4\29\0005\5\30\0=\5\31\0045\5 \0=\5!\0045\5\"\0=\5#\0045\5$\0=\5%\4=\4&\3=\3'\0025\3(\0=\3)\0025\3*\0=\3+\0025\3,\0=\3-\2B\0\2\1K\0\1\0\26context_commentstring\1\0\2\19enable_autocmd\1\venable\2\fautotag\1\0\1\venable\2\fendwise\1\0\1\venable\2\16textobjects\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[[\17@class.outer\a[m\20@function.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]]\17@class.outer\a]m\20@function.outer\1\0\2\14set_jumps\2\venable\2\tswap\18swap_previous\1\0\1\15<leader>cX\21@parameter.inner\14swap_next\1\0\1\15<leader>cx\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\1\0\4\aac\17@class.outer\aif\20@function.inner\aic\17@class.inner\aaf\20@function.outer\1\0\2\14lookahead\2\venable\2\17textsubjects\1\0\3\6;!textsubjects-container-outer\6.\23textsubjects-smart\ai;!textsubjects-container-inner\1\0\2\venable\2\19prev_selection\6,\fmatchup\1\0\1\venable\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\21node_incremental\bgrn\1\0\1\venable\2\frainbow\1\0\2\18extended_mode\2\venable\2\14highlight\1\0\1\venable\2\1\0\2\17sync_install\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
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
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n≠\n\0\0\v\0002\0R6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0006\2\3\0009\2\4\2+\3\2\0=\3\5\0026\2\1\0'\4\2\0B\2\2\0029\2\6\0025\4.\0005\5\b\0005\6\a\0=\6\t\0055\6\v\0005\a\n\0=\a\f\0065\a\r\0=\a\14\6=\6\15\0056\6\1\0'\b\16\0B\6\2\0029\6\17\6=\6\18\0055\6\19\0=\6\20\0056\6\1\0'\b\16\0B\6\2\0029\6\21\6=\6\22\0055\6\23\0=\6\24\0054\6\0\0=\6\25\0055\6\26\0=\6\27\0055\6\28\0=\6\29\0056\6\1\0'\b\30\0B\6\2\0029\6\31\0069\6 \6=\6!\0056\6\1\0'\b\30\0B\6\2\0029\6\"\0069\6 \6=\6#\0056\6\1\0'\b\30\0B\6\2\0029\6$\0069\6 \6=\6%\0056\6\1\0'\b\30\0B\6\2\0029\6&\6=\6&\0055\6+\0005\a)\0006\b\1\0'\n'\0B\b\2\0029\b(\b=\b*\a=\a,\6=\6-\5=\5/\0045\0050\0=\0051\4B\2\2\1K\0\1\0\20extensions_list\1\3\0\0\vthemes\nterms\rdefaults\1\0\0\rmappings\6n\1\0\0\6q\1\0\0\nclose\22telescope.actions\27buffer_previewer_maker\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\vborder\17path_display\1\2\0\0\rtruncate\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\1\2\0\0\17node_modules\16file_sorter\19get_fuzzy_file\22telescope.sorters\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\3\19preview_cutoff\3x\vheight\4ö≥ÊÃ\tô≥¶ˇ\3\nwidth\4◊«¬Î\3äÆØˇ\3\1\0\3\20prompt_position\btop\18results_width\4ö≥ÊÃ\tô≥¶ˇ\3\18preview_width\4ö≥ÊÃ\tô≥Üˇ\3\22vimgrep_arguments\1\0\t\20layout_strategy\15horizontal\21sorting_strategy\14ascending\23selection_strategy\nreset\17initial_mode\vinsert\17entry_prefix\a  \20selection_caret\a  \18prompt_prefix\v ÔÄÇ  \19color_devicons\2\rwinblend\3\0\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\nsetup\26theme_switcher_loaded\6g\bvim\14telescope\frequire\npcall\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\ny\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3Ä)\1\15\0L\1\2\0X\1\bÄ9\1\0\0\a\1\2\0X\1\5Ä6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµÊÃô\19ô≥Ê˛\3ò\2\1\0\4\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0024\3\0\0=\3\6\0026\3\a\0009\3\b\0039\3\t\3=\3\t\2B\0\2\1K\0\1\0\nshell\6o\bvim\20shade_filetypes\tsize\1\0\t\17persist_size\2\20insert_mappings\2\20start_in_insert\2\19shading_factor\0061\20shade_terminals\1\17hide_numbers\2\17open_mapping\n<c-\\>\14direction\15horizontal\18close_on_exit\2\0\nsetup\15toggleterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    commands = { "UndoTreeToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\n≤\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\n\0\0\thelp\14dashboard\nalpha\vpacker\tnorg\rDoomInfo\rNvimTree\fOutline\15toggleterm\27Illuminate_ftblacklist$Illuminate_highlightUnderCursor\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ritzier/.local/share/nvim/site/pack/packer/opt/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^Comment"] = "Comment.nvim",
  ["^nvim%-autopairs"] = "nvim-autopairs",
  ["^nvim%-autopairs%.completion%.cmp"] = "nvim-autopairs"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\n^\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireO\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\thook\1\0\0\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: nightfox.nvim
time([[Config for nightfox.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme duskfox\bcmd\bvim\0", "config", "nightfox.nvim")
time([[Config for nightfox.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\nÿ\1\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\0016\1\6\0=\0\1\1K\0\1\0\bvim\nicons\1\0\5\nTRACE\b‚úé\nDEBUG\bÔÜà\tINFO\bÔ†µ\nERROR\bÔôô\tWARN\bÔî©\1\0\5\18minimum_width\0032\22background_colour\vNormal\ftimeout\3–\15\vrender\fdefault\vstages\nslide\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleRefresh lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndoTreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndoTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> gb <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-ts-autotag', 'nvim-treesitter-endwise', 'nvim-autopairs', 'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'alpha-nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'toggleterm.nvim', 'vim-illuminate', 'fidget.nvim', 'gitsigns.nvim', 'bufferline.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-treesitter', 'nvim-treesitter-textobjects', 'nvim-treesitter-textsubjects', 'nvim-ts-context-commentstring', 'nvim-lspconfig', 'nvim-ts-rainbow'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'gitsigns.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles(0) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
