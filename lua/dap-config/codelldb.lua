local M = {}

function M.setup(CODELLDB_PATH)
  if vim.loop.os_uname().sysname == "Windows_NT" then
    require("dap").adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = CODELLDB_PATH,
        args = { "--port", "${port}" },

        -- On windows you may have to uncomment this:
        -- detached = false,
      },
    }
  else
    require("dap").adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = CODELLDB_PATH,
        args = { "--port", "${port}" },
        detached = false,
      },
    }
  end


end

return M
