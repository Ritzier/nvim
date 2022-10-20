local Python = require("dap-config.path").python_binary
require("dap").adapters.python = {
  type = 'executable',
  command = Python,
  args = { '-m', 'debugpy.adapter' },
}
