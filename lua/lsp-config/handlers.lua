local M = {}

local config = {
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
  },

  diagnostic = {
    virtual_text = { prefix = "#", },
    signs = {
      active = signs,
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
    -- virtual_lines = true,
  },
}

function M.setup()
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
  -- vim.diagnostic.config({
  --   virtual_text = { prefix = "#", },
  --   signs = true,
  --   underline = true,
  --   update_in_insert = true,
  --   severity_sort = true,
  --   virtual_lines = true,
  --   float = {
  --     focusable = true,
  --     style = "minimal",
  --     border = "rounded",
  --     source = "always",
  --     header = "",
  --     prefix = "",
  --   },
  -- })

  vim.diagnostic.config(config.diagnostic)

  vim.diagnostic.open_float({
    width = 10,
    height = 10,
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)
end

return M
