local M = {}

function M.setup(DEBUGGER_PATH)
  require("dap-vscode-js").setup({
    node_path = "node",
    debugger_path = DEBUGGER_PATH,
    adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
  })
end

return M
