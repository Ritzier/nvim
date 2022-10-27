local keymap = vim.keymap.set

local default_opts = { noremap = true, silent = true }

keymap("n", "<ESC>", "<Esc>:noh | :lua require('goto-preview').close_all_win()<CR>", default_opts)
keymap("i", "jk", "<ESC>:w<CR>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", default_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", default_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", default_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", default_opts)
keymap("n", "<C-h>", "<C-w>h", default_opts)
keymap("n", "<C-j>", "<C-w>j", default_opts)
keymap("n", "<C-k>", "<C-w>k", default_opts)
keymap("n", "<C-l>", "<C-w>l", default_opts)

keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)
-- keymap("v", "<A-j>", ":m .+1<CR>==", default_opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", default_opts)

keymap("v", "<A-k>", ":m '>-2<CR>gv=gv", default_opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", default_opts)
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", default_opts)

keymap("n", "<A-j>", ":BufferLineCycleNext<CR>", default_opts)
keymap("n", "<A-k>", ":BufferLineCyclePrev<CR>", default_opts)
keymap("n", "<A-S-j>", ":BufferLineMoveNext<CR>", default_opts)
keymap("n", "<A-S-k>", ":BufferLineMovePrev<CR>", default_opts)
keymap("n", "<C-x>", ":bd", default_opts)

-- keymap("n", "<C-a>", ":vertical resize -1<CR>", default_opts)
-- keymap("n", "<C-]>", ":vertical resize +4<CR>", default_opts)
-- keymap("n", "<C-A-[>", ":echo 'hi'<CR>", default_opts)
keymap("n", "<S-c", ":vertical resize -1<CR>", default_opts)
keymap("n", "<A-S-+>", ":vertical resize +1<CR>", default_opts)

-- -- Overseer
-- keymap("n", "<leader>oq", ":OverseerQuickAction<CR>", default_opts)
-- keymap("n", "<leader>ob", ":OverseerBuild<CR>", default_opts)
-- keymap("n", "<leader>oo", ":OverseerToggle<CR>", default_opts)
-- keymap("n", "<leader>r", ":OverseerRun<CR>", default_opts)
-- keymap("n", "<leader>t", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", default_opts)

-- Align
keymap("n", "ga", ":EasyAlign<CR>", silent)
keymap("x", "ga", ":'<, '>EasyAlign<CR>", silent)

-- Goto
keymap("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", default_opts)
keymap("n", "gt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", default_opts)
keymap("n", "gi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", default_opts)
keymap("n", "gr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", default_opts)
keymap("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", default_opts)

-- require("which-key").register({
--   w = {
--     name = "Workspace",
--     a = { name = "Add Workspace Folder" },
--     r = { name = "Remove Workspace Folder" },
--     l = { name = "List Workspace Folder" },
--   },
--   e = { name = "Diagnostic Open Float" }
-- }, { prefix = "<space>" })

keymap("n", "<C-s>", "<cmd>w<CR>", default_opts)
keymap("i", "<C-s>", "<cmd>w<CR>", default_opts)

require("which-key").register({
  T = {
    name = "Telescope",
    l = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Live Grep" },
    f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find Files" },
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffer" },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help Tags" }
  },
  t = {
    name = "Trouble",
    t = { "<cmd>TroubleToggle<CR>", "Toggle" },
    d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Document Diagnostics" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Worksapce Diagnostics" },
    q = { "<cmd>TroubleToggle quickfix<CR>", "Quick Fix" },
    l = { "<cmd>TroubleToggle loclist<CR>", "Loclist" },
    r = { "<cmd>TroubleToggle lsp_references<CR>", "References" }
  },
  d = {
    name = "DAP",
    R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
    U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  },

}, { prefix = "<leader>" })

require("which-key").register({
  o = {
    name = "Overseer",
    q = { ":OverseerQuickAction<CR>", "OverSeerQuickAction" },
    o = { ":OverseerToggle<CR>", "OverSeerToggle" },
    b = { ":OverseerBuild<CR>", "OverSeerBuild" },
    r = { ":OverseerRun<CR>", "OverSeerRun" },
    C = { ":OverseerClose<CR>", "OverseerClose" },
    c = { ":OverseerRunCmd<CR>", "OVerseerRunCmd" },
    s = { "<cmd>OverseerSaveBundle<cr>", "OverseerSaveBundle" },
    a = { "<cmd>OverseerTaskAction<cr>", "OverseerTaskAction" },
    d = { "<cmd>OverseerDeleteBundle<cr>", "OverseerDeleteBundle" },
  },
  r = { ":OverseerRun<CR>", "OverSeer Run" },
  s = {
    name = "lspsaga",
    f = { "<cmd>Lspsaga lsp_finder<cr>", "finder" },
    n = { "<cmd>Lspsaga rename<cr>", "rename" },
    c = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "show cursor diagnostics" },
    k = { "<cmd>Lspsaga hover_doc<cr>", "hover doc" },
    o = { "<cmd>LSoutlineToggle<cr>", "outline toggle" },
    d = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
  },

  t = { ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Neotest Run" },
}, { prefix = "<space>", silent = true, noremap = true })

require("which-key").register({
  d = {
      name = "Debug",
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    },
  },
  { mode = "v", prefix = "<leader>", buffer = nil, silent = true, noremap = true, nowait = false, })
