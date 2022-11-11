local M = {}

function M.setup(CODELLDB_PATH)
  require("dap").adapters.codelldb = {
    type = "server",
    port = "8011",
    executable = {
      command = CODELLDB_PATH,
      args = { "--port", "8011" },
    }
  }
end

return M
