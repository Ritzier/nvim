local servers = {
  -- "sumneko_lua",
  "lua_ls",
  "bashls",
  "clangd",
  "cssls",
  "gopls",
  "html",
  "jsonls",
  "omnisharp",
  "pyright",
  "rust_analyzer",
  "yamlls",
  "zls",
}

require("lsp-config.lsp").setup(servers)

require("lsp-config.handlers").setup()

require("lsp-config.mason").setup()
