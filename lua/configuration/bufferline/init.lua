local opts = {
  options = {
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
    modified_icon = "●",
    indicator = {
      style = "underline"
    },
  },
  highlights = {
    indicator_selected = { sp = "#eb6f92" },
    buffer_selected = { sp = "#eb6f92" },
  }
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
