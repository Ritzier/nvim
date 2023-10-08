return function()
  require("mason-lspconfig").setup({
    ensure_installed = require("plugins.lsp.servers_list")
  })
end
