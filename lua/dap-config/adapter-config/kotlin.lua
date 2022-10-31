local M = {}

require("dap").adapters.kotlin = {
  type = "executable",
  command = DEBUGGER_LOCATION .. "/adapter/build/install/adapter/bin/kotlin-debug-adapter",
  args = { "--interpreter=vscode" },
}

return M
