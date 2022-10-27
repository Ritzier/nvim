local M = {}

function M.setup(on_attach, capabilities, handlers)
  require("lspconfig")["pyright"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
    settings = {
      python = {
        analysis = {
          inlayHints = {
            variableTypes = true,
            functionReturnTypes = true,
          }
        }
      }
    }
  })
end

return M
