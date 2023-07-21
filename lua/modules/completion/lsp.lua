return function()
	local lspconfig = require("lspconfig")
	local servers = require("core.customize")["servers"]

	require("lspconfig.ui.windows").default_options.border = "rounded"

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		underline = true,
		virtual_text = diagnostics_virtual_text and {
			severity_limit = diagnostics_level,
		} or false,
		-- set update_in_insert to false bacause it was enabled by lspsaga
		update_in_insert = false,
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		close_events = { "BufHidden", "InsertLeave" },
	})

	local on_attach = function(client, bufnr)
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr")

		if client.server_capabilities.definitionProvider then
			vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
		end

		require("keymaps.lsp")(bufnr)
	end

	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	for _, server in ipairs(servers) do
		local ok, handler = pcall(require, "modules.completion.servers." .. server)
		if not ok then
			lspconfig[server].setup(opts)
		else
			handler(opts)
		end
	end

    require("modules.completion.servers.null_ls")(opts)
end
