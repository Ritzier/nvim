return function()
	local lspconfig = require("lspconfig")

    local servers = require("core.settings")["lsp"]

	local on_attach = require("modules.lsp.servers.on_attach")
	local capabilities = require("modules.lsp.servers.capabilities")

	-- require("modules.lsp.handlers")()

	for _, server in ipairs(servers) do
		if server == "lua_ls" then
			require("modules.lsp.servers.lua_ls")(on_attach, capabilities)
		elseif server == "bashls" then
			require("modules.lsp.servers.bashls")(on_attach, capabilities)
		elseif server == "clangd" then
			require("modules.lsp.servers.clangd")(on_attach, capabilities)
		elseif server == "cssls" then
			require("modules.lsp.servers.cssls")(on_attach, capabilities)
		elseif server == "gopls" then
			require("modules.lsp.servers.gopls")(on_attach, capabilities)
		elseif server == "html" then
			require("modules.lsp.servers.html")(on_attach, capabilities)
		elseif server == "jsonls" then
			require("modules.lsp.servers.jsonls")(on_attach, capabilities)
		elseif server == "omnisharp" then
			require("modules.lsp.servers.omnisharp")(on_attach, capabilities)
		elseif server == "pyright" then
			require("modules.lsp.servers.pyright")(on_attach, capabilities)
		elseif server == "rust_analyzer" then
			require("modules.lsp.servers.rust_analyzer")(on_attach, capabilities)
		elseif server == "yamlls" then
			require("modules.lsp.servers.yamlls")(on_attach, capabilities)
		elseif server == "null-ls" then
			require("modules.lsp.servers.null-ls")(on_attach)
		else
			lspconfig[server].setup({ on_attach = on_attach, capabilities = capabilities })
		end
	end
end
