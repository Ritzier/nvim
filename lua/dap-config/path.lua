local M = {}

if vim.loop.os_uname().sysname == "Windows_NT" then
  p = "\\"
else
  p = "/"
end

M.MASON_BIN = vim.fn.stdpath("data") .. p .. "mason" .. p .. "bin" .. p
M.MASON_PACKAGES = vim.fn.stdpath("data") .. p .. "mason" .. p .. "packages" .. p


if vim.loop.os_uname().sysname == "Windows_NT" then
  M.BASH_DEBUGGER = M.MASON_BIN .. "bash-debug-adapter.cmd"
  M.BASHDB_DIR = M.MASON_PACKAGES .. "bash-debug-adapter" .. p .. "extension" .. p .. "bashdb_dir" .. p
  M.BASHDB = M.BASHDB_DIR .. p .. "bashdb"
  M.chromeAdapter = M.MASON_BIN .. "chrome-debug-adapter.cmd"
  M.codelldb = M.MASON_BIN .. "codelldb.cmd"
  M.liblldb = M.MASON_PACKAGES .. "codelldb" .. p .. "extension" .. p .. "lldb" .. p .. "lib" .. p .. "liblldb.so"
  M.debugpy_adapter = M.MASON_BIN .. "debugpy-adapter.cmd"
  M.netcoredbg = M.MASON_BIN .. "netcoredbg.cmd"
  M.kotlin_adapter = "" 
  M.coreclr = ""
else
  M.BASH_DEBUGGER = M.MASON_BIN .. "bash-debug-adapter"
  M.BASHDB_DIR = M.MASON_PACKAGES .. "bash-debug-adapter" .. p .. "extension" .. p .. "bashdb_dir"
  M.BASHDB = M.BASHDB_DIR .. p .. "bashdb"
  M.chromeAdapter = M.MASON_BIN .. "chrome-debug-adapter"
  M.codelldb = M.MASON_BIN .. "codelldb"
  M.liblldb = M.MASON_PACKAGES .. "codelldb" .. p .. "extension" .. p .. "lldb" .. p .. "lib" .. p .. "liblldb.so"
  M.debugpy_adapter = M.MASON_BIN .. "debugpy-adapter"
end

return M
