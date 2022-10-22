vim.keymap.set("n", "1", "<cmd>RustRunnables<CR>", { silent = true })
-- vim.keymap.set("n", "2", "<cmd>RustRun<CR>", { silent = true })
vim.keymap.set("n", "2", ":!cargo run<CR>", { silent = true })
vim.keymap.set("n", "3", ":!cargo run --release<CR>", { silent = true })

require("which-key").register({
  r = {
    name = "Rust",
    d = { "<cmd>RustDebuggables<CR>", "Debug" },
    c = { "<cmd>RustOpenCargo<CR>", "Open Cargo" },
    w = { "<cmd>RustReloadWorkspace<CR>", "Reload Workspace" },
    p = { "<cmd>RustPlay<CR>", "Rust Playground" },
    r = { "!cargo check<CR>", "Cargo Check" },
  },
  f = { "<cmd>RustFmt<CR>", "Rust Format" },
  m = { "<cmd>RustExpandMacro<CR>", "Rust Expand Marcro" },
  u = { "<cmd>RustMoveItemUp<CR>", "Move Item Up" },
  p = { "<cmd>RustMoveItemDown<CR>", "Move Item Down" },
  d = { "<cmd>RustParentModule<CR>", "Rust ParentModule" },
}, { prefix = "<space>" })
