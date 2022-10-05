local M = {}

-- https://github.com/gradle/gradle/releases
-- https://github.com/fwcd/kotlin-debug-adapter

if vim.loop.os_uname().sysname == "Windows_NT" then
  M.DEBUG_PATH = vim.fn.stdpath("config") .. "kotlin-debug-adapter\\bin\\kotlin-debug-adapter.bat"
else
  M.DEBUG_PATH = vim.fn.stdpath("config") .. "kotlin-debug-adapter/bin/kotlin-debug-adapter"
end

function M.setup()
  local dap = require "dap"

  -- Adapter configuration
  dap.adapters.kotlin = {
    type = "executable",
    command = M.DEBUG_PATH,
    args = { "--interpreter=vscode" },
  }

  -- Configuration
  dap.configurations.kotlin = {
    {
      type = "kotlin",
      name = "launch - kotlin",
      request = "launch",
      projectRoot = vim.fn.getcwd() .. "/app",
      mainClass = function()
        -- return vim.fn.input("Path to main class > ", "myapp.sample.app.AppKt", "file")
        return vim.fn.input("Path to main class > ", "", "file")
      end,
    },
    -- {
    --   type = "kotlin",
    --   name = "attach - kotlin",
    --   request = "attach",
    --   projectRoot = vim.fn.getcwd() .. "/app",
    --   hostName = "localhost",
    --   port = 5005,
    --   timeout = 1000,
    -- },
  }
end

return M
