local M = {}

local DEBUGGER_PATH = vim.fn.stdpath "data" .. "/site/pack/packer/opt/vscode-js-debug"

function M.setup()
  require("dap-vscode-js").setup({
    node_path = "node",
    debugger_path = DEBUGGER_PATH,
    adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
  })
end

return M
