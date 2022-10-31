local M = {}

function M.setup(chromeDebug)
  require("dap").adapters.chrome = {
    type = "executable",
    command = "node",
    -- chromeDebug.js
    args = { chromeDebug },
  }
end

return M
