local M = {}

-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Dart
-- Make sure follow the step

local debugJS = "C:\\Program Files\\Dart-Code\\out\\dist\\debug.js"
local dartSdkPath = "C:\\Program Files (x86)\\flutter\\bin\\cache\\dart-sdk\\"
local flutterSdkPath = "C:\\Program Files (x86)\\flutter"

function M.setup()
  require("dap").adapters.dart = {
    type = "executable",
    command = "node",
    args = { debugJS, "flutter" },
  }

  require("dap").configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch flutter",
      dartSdkPath = dartSdkPath,
      flutterSdkPath = flutterSdkPath,
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
    }
  }
end

return M
