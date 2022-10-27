local M = {}

function M.setup(on_attach, capabilities, handlers)
  require("lspconfig")["html"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
    cmd = { "html-languageserver", "--stdio" },
    filetypes = { "html" },
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = { css = true, javascript = true },
    },
    settings = {},
    single_file_support = true,
  })
end

return M
