local M = {}

local NETCOREDBG = require("dap-config.path").NETCOREDBG
local CODELLDB = require("dap-config.path").CODELLDB
local chromeDebugger = require("dap-config.path").CHROME_DEBUGGER

local function configure()
  local dap_breakpoint = {
    error = {
      text = "🟥",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "⭐️",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function configure_exts()
  require("nvim-dap-virtual-text").setup {
    commented = true,
  }

  local dap, dapui = require "dap", require "dapui"
  dapui.setup {} -- use default
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

local function configure_debuggers()
  require("dap-config.codelldb").setup(CODELLDB)
  require("dap-config.csharp").setup(NETCOREDBG)
  require("dap-config.kotlin").setup()
  require("dap-config.lua").setup()
  require("dap-config.python").setup()
  require("dap-config.rust").setup()
  require("dap-config.go").setup()
  require("dap-config.c").setup()
  require("dap-config.cpp").setup()
  require("dap-config.rust").setup()
  require("dap-config.typescript").setup(chromeDebugger)
end

local function only_windows()
  if vim.loop.os_uname().sysname == "Windows_NT" then
    require("dap-config.dart").setup()
  end
end

function M.setup()
  configure() -- Configuration
  configure_exts() -- Extensions
  configure_debuggers() -- Debugger
  only_windows()
  require("dap-config.keymaps").setup() -- Keymaps
end

return M
