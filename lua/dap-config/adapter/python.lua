local path = require("dap-config.path").debugpy_adapter

require("dap").adapters.python = {
  type = "executable",
  command = path,
}
