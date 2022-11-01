local M = {}

function M.setup(KOTLIN_ADAPTER_PATH)
  require("dap").adapters.kotlin = {
    type = "executable",
    args = { "--interpreter=vscode" },
    command = KOTLIN_ADAPTER_PATH,
  }
end

return M
