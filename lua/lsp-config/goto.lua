require('goto-preview').setup {
  width = 120; -- Width of the floating window
  height = 15; -- Height of the floating window
  border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
  default_mappings = false; -- Bind default mappings
  debug = false; -- Print debug information
  opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
  resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
  post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
  focus_on_open = true; -- Focus the floating window when opening it.
  dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
  force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
  bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
}

require("which-key").register({
  g = {
    name = "Goto-Preview",
    d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Definition" },
    t = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "Type Difinition" },
    i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Implementation" },
    r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "References" },
    p = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close All Window" }
  }
}, { prefix = "<leader>" })
