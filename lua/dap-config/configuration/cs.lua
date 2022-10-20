local netcoredbg = require("dap-config.path").NETCOREDBG
require("dap").configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input(netcoredbg)
    end,

  }
}
