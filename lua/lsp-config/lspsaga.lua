local colors = require("utils").get_palette()

require("lspsaga").setup({
  preview = {
    lines_above = 1,
    lines_below = 12,
  },
  scroll_preview = {
    scroll_down = "<C-j>",
    scroll_up = "<C-k>",
  },
  request_timeout = 3000,
  finder = {
    edit = { "o", "<CR>" },
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = { "q", "<ESC>" },
  },
  definition = {
    edit = "<C-c>o",
    vsplit = "<C-c>v",
    split = "<C-c>s",
    tabe = "<C-c>t",
    quit = "q",
    close = "<Esc>",
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
    virtual_text = true,
  },
  diagnostic = {
    twice_into = false,
    show_code_action = false,
    show_source = true,
    keys = {
      exec_action = "<CR>",
      quit = "q",
      go_action = "g",
    },
  },
  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    in_select = true,
  },
  outline = {
    win_position = "right",
    win_with = "_sagaoutline",
    win_width = 30,
    show_detail = true,
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
    in_custom = true,
    enable = true,
    separator = " > ",
    hide_keyword = true,
    show_file = false,
  },
  ui = {
    theme = "round",
    border = "rounded", -- Can be single, double, rounded, solid, shadow.
    winblend = 0,
    expand = "",
    collapse = "",
    preview = "",
    code_action = "",
    diagnostic = "",
    incoming = "",
    outgoing = "",
    colors = {
      normal_bg = colors.base,
      title_bg = colors.base,
      red = colors.red,
      megenta = colors.maroon,
      orange = colors.peach,
      yellow = colors.yellow,
      green = colors.green,
      cyan = colors.sapphire,
      blue = colors.blue,
      purple = colors.mauve,
      white = colors.text,
      black = colors.mantle,
      fg = colors.text,
    },
    -- kind = {
    --   Class = { "ﴯ", colors.yellow },
    --   Constant = { "", colors.peach },
    --   Constructor = { "", colors.sapphire },
    --   Enum = { "", colors.yellow },
    --   EnumMember = { "", colors.rosewater },
    --   Event = { "", colors.yellow },
    --   Field = { "", colors.teal },
    --   File = { "", colors.rosewater },
    --   Function = { "", colors.blue },
    --   Interface = { "", colors.yellow },
    --   Key = { "", colors.red },
    --   Method = { "", colors.blue },
    --   Module = { "", colors.blue },
    --   Namespace = { "", colors.blue },
    --   Number = { "", colors.peach },
    --   Operator = { "", colors.sky },
    --   Package = { "", colors.blue },
    --   Property = { "ﰠ", colors.teal },
    --   Struct = { "", colors.yellow },
    --   TypeParameter = { "", colors.maroon },
    --   Variable = { "", colors.peach },
    --   -- Type
    --   Array = { "", colors.peach },
    --   Boolean = { "蘒", colors.peach },
    --   Null = { "ﳠ", colors.yellow },
    --   Object = { "", colors.yellow },
    --   String = { "", colors.green },
    --   -- ccls-specific icons.
    --   TypeAlias = { "", colors.green },
    --   Parameter = { "", colors.blue },
    --   StaticMethod = { "", colors.peach },
    --   -- Microsoft-specific icons.
    --   Text = { "", colors.green },
    --   Snippet = { "", colors.mauve },
    --   Folder = { "", colors.blue },
    --   Unit = { "", colors.green },
    --   -- Value = { icons.kind.Value, colors.peach },
    --   value = { "", colors.peach }
    -- },
  },
})
