local M = {}

if vim.loop.os_uname().sysname == "Windows_NT" then
  p = "\\"
else
  p = "/"
end

M.LOCATION = vim.fn.stdpath("data") .. p .. "mason" .. p .. "bin" .. p

if vim.loop.os_uname().sysname == "Windows_NT" then
  M.BASH_DEBUGGER = M.LOCATION .. "bash-debug-adapter.cmd"
  M.chromeAdapter = M.LOCATION .. "chrome-debug-adapter.cmd"
  M.codelldb = M.LOCATION .. "codelldb.cmd"
  M.debugpy_adapter = M.LOCATION .. "debugpy-adapter.cmd"
  M.netcoredbg = M.LOCATION .. "netcoredbg.cmd"
  M.kotlin_adapter = "" 
  M.coreclr = ""
end

return M
