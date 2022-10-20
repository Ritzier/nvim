local netcoredbg = require("dap-config.path").NETCOREDBG
require("dap").adapters.coreclr = {
  type = 'executable',
  command = netcoredbg,
  args = {'--interpreter=vscode'}
}
