local M = {}

function M.setup(on_attach, capbilities, handlers)
  require("lspconfig")["yamlls"].setup({
    on_attach = on_attach,
    capbilities = capbilities,
    handlers = handlers,
    schemastore = {
      enable = true,
    },
    settings = {
      yaml = {
        hover = true,
        completion = true,
        validate = true,
        schemas = require("schemastore").json.schemas(),
      },
    },
  })
end

return M
