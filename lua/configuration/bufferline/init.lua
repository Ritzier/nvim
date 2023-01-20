local opts = {
  options = {
    number = nil,
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    show_buffer_close_icons = true,
    show_buffer_icons = true,
    show_tab_indicators = true,
    diagnostics = "nvim_lsp",
    always_show_bufferline = true,
    separator_style = "thin",
    modified_icon = "●",
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' }
    },
    groups = {
      items = {
        require('bufferline.groups').builtin.pinned:with({ icon = "" })
      }
    },
    indicator = {
      style = "underline"
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        padding = 1,
      },
      {
        filetype = "lspsagaoutline",
        text = "Lspsaga Outline",
        text_align = "center",
        padding = 1,
      },
    },
    diagnostics_indicator = function(count)
      return "(" .. count .. ")"
    end,
  },
}


local cp = require("utils").get_palette() -- Get the palette.

local catppuccin_hl_overwrite = {
  highlights = require("catppuccin.groups.integrations.bufferline").get({
    styles = { "italic", "bold" },
    custom = {
      mocha = {
        -- Hint
        hint = { fg = cp.rosewater },
        hint_visible = { fg = cp.rosewater },
        hint_selected = { fg = cp.rosewater },
        hint_diagnostic = { fg = cp.rosewater },
        hint_diagnostic_visible = { fg = cp.rosewater },
        hint_diagnostic_selected = { fg = cp.rosewater },
      },
    },
  }),
}

opts = vim.tbl_deep_extend("force", opts, catppuccin_hl_overwrite)
require("bufferline").setup(opts)
