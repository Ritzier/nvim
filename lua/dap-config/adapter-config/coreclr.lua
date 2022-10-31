local M = {}

function M.setup(CORECLR_PATH)
  require("dap").adapters.coreclr = {
    type = "executable",
    command = CORECLR_PATH,
    args = { "--interpreter=vscode" },
  }
end

return M
