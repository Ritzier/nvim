require("dap").configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to DLL > ", vim.fn.getcwd() .. "/bin/Debug/", "file")
    end,
  },
}
