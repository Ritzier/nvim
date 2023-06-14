return function(on_attach, capbilities)
  require("lspconfig")["yamlls"].setup({
    on_attach = on_attach,
    capbilities = capbilities,
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
