local M = {}

function M.setup(CODELLDB_PATH)
  require("dap").adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = CODELLDB_PATH,
      args = { "--port", "${port}" },
    }
  }
end

return M
