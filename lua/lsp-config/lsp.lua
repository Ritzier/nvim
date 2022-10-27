local M = {}

local on_attach = require("lsp-config.servers.on_attach").on_attach
local capabilities = require("lsp-config.servers.capabilities").capabilities

local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

local function set_server(name, attach, capabilitie, handler)
  require("lsp-config.servers." .. name).setup(attach, capabilitie, hanlder)
end

function M.setup(servers)
  for _, server in ipairs(servers) do
    if server == "sumneko_lua" then
      set_server("sumneko_lua", on_attach, capabilities, hanlders)

    elseif server == "gopls" then
      set_server("gopls", on_attach, capabilities, hanlders)

    elseif server == "efmls-configs" then
      require("efmls-configs").init({
        on_attach = on_attach,
        capabilities = capabilities,
        hanlders = handlers,
        init_options = { documentFormatting = true, codeAction = true },
      })

    elseif server == "efm" then
      require("lspconfig").efm.setup({
        on_attach = on_attach,
        handlers = handlers,
        init_options = { documentFormatting = true },
        settings = {
          languages = require("lsp-config.efm"),
        },
      })

    elseif server == "omnisharp" then
      set_server("omnisharp", on_attach, capabilities, hanlders)

    elseif server == "cssls" then
      set_server("cssls", on_attach, capabilities, hanlders)

    elseif server == "html" then
      set_server("html", on_attach, capabilities, hanlders)

    elseif server == "clangd" then
      set_server("clangd", on_attach, capabilities, hanlders)

    elseif server == "yamlls" then
      set_server("yamlls", on_attach, capabilities, hanlders)

    elseif server == "jsonls" then
      set_server("jsonls", on_attach, capabilities, hanlders)

    elseif server == "rust_analyzer" then
      set_server("rust_analyzer", on_attach, capabilitie, hanlders)

    elseif server == "bashls" then
      set_server("bashls", on_attach, capabilities, hanlders)

    elseif server == "pyright" then
      set_server("pyright", on_attach, capabilities, hanlders)

    else
      require("lspconfig")[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
      })

    end
  end
end

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = { prefix = "#", },
  signs = true,
  underline = ture,
  update_in_insert = true,
  severity_sort = true,
  virtual_lines = true,
})

vim.diagnostic.open_float({
  width = 10,
  height = 10,
})

return M
