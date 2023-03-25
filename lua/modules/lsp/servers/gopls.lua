return function(on_attach, capabilities)
  require("lspconfig")["gopls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 500,
    },
    cmd = { "gopls", "-remote=auto" },
    settings = {
      gopls = {
        usePlaceholders = true,
        analyses = {
          nilness = true,
          shadow = true,
          unusedparams = true,
          unusewrites = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        }
      },
    },
  })
end