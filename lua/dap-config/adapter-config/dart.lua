local debugJS = require("dap-config.path").debugJS

require("dap").adapters.dart = {
  type = "executable",
  command = "node",
  args = { debugJS, "flutter" },
}
