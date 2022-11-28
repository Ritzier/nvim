local path = require("dap-config.path").codelldb

require("dap").adapters.lldb = {
  type = 'executable',
  command = path,
  name = 'lldb',
}
