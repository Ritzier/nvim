local metals_config = require("metals").bare_config()
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },

}

metals_config.on_attach = function()
  require("lsp-config.servers.on_attach")
end
metals_config.capabilities = require("lsp-config.servers.capabilities")

metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    prefix = '#',
  }
}
)
