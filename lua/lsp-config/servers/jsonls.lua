local M = {}

function M.setup(on_attach, capabilities, handlers)
  require("lspconfig")["jsonls"].setup({
    on_attach = on_attach,
    capbilities = capabilities,
    handlers = handlers,
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  })
end

return M
