local path = require("dap-config.path").coreclr

require("dap").adapters.coreclr = {
  type = "executable",
  command = path,
  args = { "--interpreter=vscode" },
}
