local function get_palette()
  if vim.g.colors_name == "catppuccin" then
    -- If the colorscheme is catppuccin then use the palette.
    return require("catppuccin.palettes").get_palette()
  else
    -- Default behavior: return lspsaga's default palette.
    local palette = require("lspsaga.lspkind").colors
    palette.peach = palette.orange
    palette.flamingo = palette.orange
    palette.rosewater = palette.yellow
    palette.mauve = palette.violet
    palette.sapphire = palette.blue
    palette.maroon = palette.orange

    return palette
  end
end

local colors = get_palette()

require("lspsaga").init_lsp_saga({
  border_style = "rounded",
  diagnostic_header = { " ", " ", "  ", " " },
  custom_kind = {
    File = { " ", colors.rosewater },
    Module = { " ", colors.blue },
    Namespace = { " ", colors.blue },
    Package = { " ", colors.blue },
    Class = { "ﴯ ", colors.yellow },
    Method = { " ", colors.blue },
    Property = { "ﰠ ", colors.teal },
    Field = { " ", colors.teal },
    Constructor = { " ", colors.sapphire },
    Enum = { " ", colors.yellow },
    Interface = { " ", colors.yellow },
    Function = { " ", colors.blue },
    Variable = { " ", colors.peach },
    Constant = { " ", colors.peach },
    Number = { " ", colors.peach },
    Key = { " ", colors.red },
    EnumMember = { " ", colors.teal },
    Struct = { " ", colors.yellow },
    Event = { " ", colors.yellow },
    Operator = { " ", colors.sky },
    TypeParameter = { " ", colors.maroon },
    -- Type
    Array = { " ", colors.peach },
    Boolean = { " ", colors.peach },
    Null = { "ﳠ ", colors.yellow },
    Object = { " ", colors.yellow },
    String = { " ", colors.green },
    -- ccls-specific icons.
    TypeAlias = { " ", colors.green },
    Parameter = { " ", colors.blue },
    StaticMethod = { "ﴂ ", colors.peach },
    Macro = { " ", colors.red },
  },
  code_action_lightbulb = {
    enbale = false,
    enable_in_insert = false,
    cache_code_action = false,
    sign = false,
  },
  max_preview_lines = 20,
  symbol_in_winbar = {
    enable = false,
    in_custom = true,
    separator = "  ",
    show_file = false,
    file_formatter = "",
    click_support = function(node, clicks, button, modifiers)
      local st = node.range.start
      local en = node.range["end"]
      if button == "l" then
        if clicks == 2 then
        else -- jump to node's starting line+char
          vim.fn.cursor(st.line + 1, st.character + 1)
        end
      elseif button == "r" then
        if modifiers == "s" then
          print("lspsaga") -- shift right click to print "lspsaga"
        end -- jump to node's ending line+char
        vim.fn.cursor(en.line + 1, en.character + 1)
      elseif button == "m" then
        -- middle click to visual select node
        vim.fn.cursor(st.line + 1, st.character + 1)
        vim.api.nvim_command([[normal v]])
        vim.fn.cursor(en.line + 1, en.character + 1)
      end
    end,
  },
})
