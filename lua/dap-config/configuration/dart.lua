local dartSdkPath = require("dap-config.path").dartSdkPath
local flutterSdkPath = require("dap-config.path").flutterSdkPath

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
