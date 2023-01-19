local hop = require('hop')
local directions = require('hop.hint').HintDirection

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

keymap("n", "<C-x>", ":bd<CR>", default_opts)

keymap("n", "<C-s>", "<cmd>w<CR>", default_opts)
keymap("i", "<C-s>", "<cmd>w<CR>", default_opts)

local M = {}

function M.map()
  require("which-key").register({
    ['[t'] = { "<cmd>lua require('todo-comments').jump_prev()<CR>", "Previous Todo Comments" },
    [']t'] = { "<cmd>lua require('todo-comments').jump_next()<CR>", "Next Todo Comments" },
    ga = { ":EasyAlign<CR>", "EasyAlign" },

  }, { mode = "n", prefix = "", silent = "true" })

  require("which-key").register({
    ga = { ":'<, '>EasyAlign<CR>", "EasyAlign" },
  }, { mode = "v", prefix = "", silent = "true" })

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
    g = {
      name = "Goto-Preview",
      d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Definition" },
      t = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "Type Difinition" },
      i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Implementation" },
      r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "References" },
      p = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close All Window" }
    },
  }, { prefix = "<leader>" })

  require("which-key").register({
    d = { ':DocsViewToggle<CR>', "Docs View" },
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
      f = { "<cmd>Lspsaga lsp_finder<CR>", "Finder" },
      n = { "<cmd>Lspsaga rename<CR>", "Rename" },
      -- Peek Definition
      -- you can edit the definition file in this flaotwindow
      -- also support open/vsplit/etc operation check definition_action_keys
      -- support tagstack C-t jump back
      p = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
      d = { "<cmd>Lspsaga goto_definition<CR>", "Goto Definition" },
      s = {
        name = "Show",
        -- Show line diagnostics you can pass arugment ++unfocus to make
        -- show_line_diagnsotic float window unfocus
        l = { "<cmd>Lspsaga show_line_diagnsotics<CR>", "Show Line Diagnostic" },
        -- Show cursor diagnostic
        -- also like show_line_diagnostics  support pass ++unfocus
        c = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show Cursor Diagnostics" },
        -- Show buffer diagnostic
        b = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "Show Buf Diagnostics" },
      },
      -- <C-o> to Jumpback
      ["["] = {
        name = "Jump Prev",
        e = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Jump Prev Diagnostic" },
        E =  {function()
        require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end, "Jump Prev Error"}
      },
      ["]"] = {
        name = "Jump Next",
        e = { "cmd>Lspsaga diagnostic_jump_next<CR>", "Jump Next Diagnostics" },
        E =  {function()
          require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
        end, "Jump Next Error"}
      },
      o = { "<cmd>Lspsaga outline<CR>", "Outline" },
      -- Hover Doc
      -- if there has no hover will have a notify no information available
      -- to disable it just Lspsaga hover_doc ++quiet
      k = { "<cmd>Lspsaga hover_doc<CR>", "Hover Doc" },
      -- Callhierarchy
      c = {
        name = "Calls",
        i = { "<cmd>Lspsaga incoming_calls<CR>", "Incoming Calls" },
        o = { "<cmd>Lspsaga outgoing_calls<CR>", "Outgoing Calls" },
      },
      t = { "<cmd>Lspsaga term_toggle<CR>", "Term Toggle" },

    },
    t = {
      name = "Test",
      a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
      f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
      F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
      l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
      L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
      n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
      N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
      o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
      S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
      s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
      p = { "<Plug>PlenaryTestFile", "PlenaryTestFile" },
      v = { "<cmd>TestVisit<cr>", "Visit" },
      x = { "<cmd>TestSuite<cr>", "Suite" },
      t = {
        name = "Test",
        l = { "<cmd>TestLast<cr>", "Run Last" },
        n = { "<cmd>TestNearest<cr>", "Run Nearest" },
      },
    }

  }, { prefix = "<space>", silent = true, noremap = true })

  require("which-key").register({
     d= {
      name = "DAP",
      e = { "<cmd>lua require'dapui'.eval()<CR>", "Evaluate" },
    },
  a = { "<cmd>Lspsaga code_action<CR>", "Code Action" }

  }, { prefix = "<leader>", mode = "v", buffer = nil, silent = true, noremap = true })

  require("which-key").register({
    ["<space>e"] = { vim.diagnostic.open_float, "Diagnostic" },
    ["[d"] = { vim.diagnostic.goto_prev, "Preview Diagnostic" },
    ["]d"] = { vim.diagnostic.goto_next, "Goto Diagnostic" },
    ["]q"] = { vim.diagnostic.setloclist, "Set Loclist" },
  },
    { mode = "n", silent = true, noremap = true, })

  require("which-key").setup({
    ["gD"] = { vim.lsp.buf.declaration, "Declaration" },
    ["gd"] = { vim.lsp.buf.definition, "Definition" },
    ["K"] = { vim.lsp.buf.hover, "Hover" },
    ["gi"] = { vim.lsp.buf.implementation, "Implementation" },
    ["<C-k>"] = { vim.lsp.buf.signature_help, "Signature Help" },
    ["<space>w"] = {
      name = "LSP Workspace",
      ["a"] = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
      ["r"] = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder" },
      ["l"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders)) end, "List Workspace Folder" },
    },
    ["D"] = { vim.lsp.buf.type_defintion, "Type Definition" },
    ["l"] = {
      name = "LSP",
      c = { vim.lsp.buf.code_action, "Code Action" },
      f = { function() vim.lsp.buf.format { async = true } end, "Format" },
      r = { vim.lsp.buf.references, "References" },
    },
    f = {
      function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end
    },
    F = {
      function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end
    },
    t = {
      function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end
    },
    T = {
      function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end
    },
  }, { prefix = "", mode = "n", silent = true, noremap = true })
end

return M
