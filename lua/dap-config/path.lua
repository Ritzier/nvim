local M = {}

if vim.loop.os_uname().sysname == "Windows_NT" then
  M.p = "\\"
else
  M.p = "/"
end

M.LOCATION = vim.fn.stdpath("data") .. M.p .. "mason" .. M.p .. "bin" .. M.p

if vim.loop.os_uname().sysname == "Windows_NT" then
  M.BASH_DEBUGGER = M.LOCATION .. "bash-debug-adapter.cmd"
  M.CHROME_DEBUGGER = M.LOCATION .. "chrome-debug-adapter.cmd"
  M.PYTHON_DEBUGGER = M.LOCATION .. "debugpy-adapter.cmd"
  M.FIREFOX_DEBUGGER = M.LOCATION .. "firefox-debug-adapter.cmd"
  M.JS_DEBUGGER = M.LOCATION .. "js-debug-adapter.cmd"
  M.NODE_DEBUGGER = M.LOCATION .. "node-debug2-adapter.cmd"
  M.PHP_DEBUGGER = M.LOCATION .. "php-debug-adapter.cmd"
  M.NETCOREDBG = M.LOCATION .. "netcoredbg.cmd"
  M.dartSdkPath = "C:\\Program Files (x86)\\flutter\\bin\\cache\\dart-sdk\\"
  M.flutterSdkPath = "C:\\Program Files (x86)\\flutter"
  M.CODELLDB = M.LOCATION .. "codelldb.cmd"
  M.debugJS = "C:\\Program Files\\Dart-Code\\out\\dist\\debug.js"
  M.python_binary = ""
else
  M.BASH_DEBUGGER = M.LOCATION .. "bash-debug-adapter"
  M.CHROME_DEBUGGER = M.LOCATION .. "chrome-debug-adapter"
  M.PYTHON_DEBUGGER = M.LOCATION .. "debugpy-adapter"
  M.FIREFOX_DEBUGGER = M.LOCATION .. "firefox-debug-adapter"
  M.JS_DEBUGGER = M.LOCATION .. "js-debug-adapter"
  M.dartSdkPath = "/usr/bin/dart"
  M.flutterSdkPath = "/usr/bin/flutter"
  M.NODE_DEBUGGER = M.LOCATION .. "node-debug2-adapter"
  M.PHP_DEBUGGER = M.LOCATION .. "php-debug-adapter"
  if vim.fn.empty(vim.fn.glob("/usr/bin/codeldb")) == 0 then
    M.CODELLDB = "/usr/bin/codelldb"
  else
    M.CODELLDB = M.LOCATION .. "codelldb"
  end

  if vim.fn.empty(vim.fn.glob("$HOME/.virtualenvs/debugpy/bin/python")) == 0 then
    M.python_binary = "$HOME/.virtualenvs/debugpy/bin/python"
  elseif vim.fn.empty(vim.fn.glob("$HOME/bin/python")) == 0 then
    M.python_binary = "$HOME/bin/python"
  elseif vim.fn.empty(vim.fn.glob("/usr/bin/python")) then
    M.python_binary = "/usr/bin/python"
  else
    require("notify")("Python binary file not found", "error")
  end
  if vim.fn.empty(M.LOCATION .. "netcoredbg") == 0 then
    M.NETCOREDBG = M.LOCATION .. "netcoredbg"
  else
    M.NETCOREDBG = "/usr/bin/netcoredbg"
  end

  -- Not set yet
  M.debugJS = ""
end

return M

-- npm install debug
