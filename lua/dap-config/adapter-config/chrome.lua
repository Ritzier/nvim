local M = {}

local HOME = os.getenv "HOME"
local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim/vscode-chrome-debug"

function M.setup()
  require("dap").adapters.chrome = {
    type = "executable",
    command = "node",
    -- chromeDebug.js
  args = { DEBUGGER_LOCATION .. "/out/src/chromeDebug.js" },
  }
end

return M
