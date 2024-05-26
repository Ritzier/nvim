local null_ls = require("null-ls")
return function()
  require("mason").setup({})

  require("mason-lspconfig").setup({
    ensure_installed = require("plugins.lsp.servers_list")
  })

  require("mason-null-ls").setup({
    ensure_installed = {
      "stylua",
    },
    handlers = {
      stylua = function(source_name, methods)
        null_ls.register(null_ls.builtins.formatting.stylua)
      end,
    }
  })
end
