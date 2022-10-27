local M = {}

function M.setup(on_attach, capabilities, handlers)
  require("lspconfig")["bashls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "bash-language-server", "start" },
    filetypes = { "zsh", "bash", "sh" },
    handlers = handlers
  })
end

return M
