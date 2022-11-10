local M = {}

function M.setup(LLDB_PATH)
  require("dap").adapters.lldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = LLDB_PATH,
      args = { "--port", "${port}" },
    }
  }
end

return M
