local M = {}

function M.setup(PATH_DEBUG)
  local dap = require "dap"

  -- Adapter configuration
  dap.adapters.coreclr = {
    type = "executable",
    command = PATH_DEBUG,
    args = { "--interpreter=vscode" },
  }

  -- Configuration
  dap.configurations.cs = {
    {
      type = "coreclr",
      name = "launch - netcoredbg",
      request = "launch",
      program = function()
        return vim.fn.input("Path to DLL > ", vim.fn.getcwd() .. "/bin/Debug/", "file")
      end,
    },
  }
end

return M
