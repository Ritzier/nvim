local M = {}

if vim.loop.os_uname().sysname == "Windows_NT" then
  p = "\\"
else
  p = "/"
end

M.LOCATION = vim.fn.stdpath("data") .. p .. "mason" .. p .. "bin" .. p
M.LOCATION2 = vim.fn.stdpath("data") .. p .. "mason" .. p .. "packages" .. p


if vim.loop.os_uname().sysname == "Windows_NT" then
  M.BASH_DEBUGGER = M.LOCATION .. "bash-debug-adapter.cmd"
  M.chromeAdapter = M.LOCATION .. "chrome-debug-adapter.cmd"
  M.codelldb = M.LOCATION .. "codelldb.cmd"
  M.liblldb = M.LOCATION2 .. "codelldb" .. p .. "extension" .. p .. "lldb" .. p .. "lib" .. p .. "liblldb.so"
  M.debugpy_adapter = M.LOCATION .. "debugpy-adapter.cmd"
  M.netcoredbg = M.LOCATION .. "netcoredbg.cmd"
  M.kotlin_adapter = "" 
  M.coreclr = ""
else
  M.BASH_DEBUGGER = M.LOCATION .. "bash-debug-adapter"
  M.chromeAdapter = M.LOCATION .. "chrome-debug-adapter"
  M.codelldb = M.LOCATION .. "codelldb"
  M.liblldb = M.LOCATION2 .. "codelldb" .. p .. "extension" .. p .. "lldb" .. p .. "lib" .. p .. "liblldb.so"
  M.debugpy_adapter = M.LOCATION .. "debugpy-adapter"
end

return M
