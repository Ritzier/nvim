local M = {}

local on_attach = require("lsp-config.servers.on_attach")
local capabilities = require("lsp-config.servers.capabilities")

function M.setup(servers)
  for _, server in ipairs(servers) do
    if server == "lua_ls" then
      -- require("lsp-config.servers.sumneko_lua").setup(on_attach, capabilities)
      require("lspconfig")["lua_ls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim", "packer_plugins" } },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              },
              maxPreload = 100000,
              preloadFileSize = 10000,
            },
            telemetry = { enable = false },
            -- Do not override treesitter lua highlighting with sumneko lua highlighting
            semantic = { enable = false },
          },
        },
      })

    elseif server == "bashls" then
      require("lsp-config.servers.bashls").setup(on_attach, capabilities)

    elseif server == "clangd" then
      require("lsp-config.servers.clangd").setup(on_attach, capabilities)

    elseif server == "cssls" then
      require("lsp-config.servers.cssls").setup(on_attach, capabilities)

    elseif server == "gopls" then
      require("lsp-config.servers.gopls").setup(on_attach, capabilities)

    elseif server == "html" then
      require("lsp-config.servers.html").setup(on_attach, capabilities)

    elseif server == "jsonls" then
      require("lsp-config.servers.jsonls").setup(on_attach, capabilities)

    elseif server == "omnisharp" then
      require("lsp-config.servers.omnisharp").setup(on_attach, capabilities)

    elseif server == "pyright" then
      require("lsp-config.servers.pyright").setup(on_attach, capabilities)

    elseif server == "rust_analyzer" then
      require("lsp-config.servers.rust_analyzer").setup(on_attach, capabilities)

    elseif server == "yamlls" then
      require("lsp-config.servers.yamlls").setup(on_attach, capabilities)

    elseif server == "zls" then
      require("lsp-config.servers.zls").setup(on_attach, capabilities)
    else
      require("lspconfig")[server].setup(on_attach, capabilities)

    end
  end
end

return M
