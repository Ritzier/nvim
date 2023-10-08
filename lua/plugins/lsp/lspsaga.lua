return function()
  require("lspsaga").setup({
    preview = {
      lines_above = 1,
      lines_below = 17,
    },
    scroll_preview = {
      scroll_down = "<C-j>",
      scroll_up = "<C-k>",
    },
    request_timeout = 3000,
    finder = {
      keys = {
        jump_to = "e",
        edit = { "o", "<CR>" },
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = { "q", "<ESC>" },
        close_in_preview = "<ESC>",
      },
    },
    definition = {
      edit = "<C-c>o",
      vsplit = "<C-c>v",
      split = "<C-c>s",
      tabe = "<C-c>t",
      quit = "q",
    },
    code_action = {
      num_shortcut = true,
      keys = {
        quit = "q",
        exec = "<CR>",
      },
    },
    lightbulb = {
      enable = false,
      sign = true,
      enable_in_insert = true,
      sign_priority = 20,
      virtual_text = false,
    },
    diagnostic = {
      on_insert = false,
      on_insert_follow = false,
      show_code_action = true,
      show_virt_line = true,
      show_source = true,
      border_follow = true,
      jump_num_shortcut = true,
      keys = {
        exec_action = "<CR>",
        quit = "q",
        go_action = "g",
      },
    },
    rename = {
      quit = "<C-c>",
      mark = "x",
      confirm = "<CR>",
      exec = "<CR>",
      in_select = true,
    },
    outline = {
      win_position = "right",
      win_with = "_sagaoutline",
      win_width = 30,
      auto_preview = false,
      auto_refresh = true,
      auto_close = true,
      keys = {
        jump = "<CR>",
        expand_collapse = "u",
        quit = "q",
      },
    },
    symbol_in_winbar = {
      enable = true,
      hide_keyword = true,
      show_file = true,
      folder_level = 1,
      color_mode = true,
      delay = 0,
    },
    beacon = {
      enable = true,
      frequency = 12,
    },
  })
end
