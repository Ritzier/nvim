return function()
	local nvim_lsp = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")
	require("lspconfig.ui.windows").default_options.border = "rounded"

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		underline = true,
		virtual_text = false, -- set update_in_insert to false because it was enabled by lspsaga
		update_in_insert = false,
	})

	vim.diagnostic.config({
		virtual_text = false,
	})

	vim.fn.sign_define("DiagnosticSignError", { text = "●", texthl = "DiagnosticSignError" })
	vim.fn.sign_define("DiagnosticSignWarn", { text = "●", texthl = "DiagnosticSignWarn" })
	vim.fn.sign_define("DiagnosticSignInfo", { text = "●", texthl = "DiagnosticSignInfo" })
	vim.fn.sign_define("DiagnosticSignHint", { text = "●", texthl = "DiagnosticSignHint" })

	local opts = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = require("keymaps.lsp").on_attach,
	}

	opts.capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	opts.capabilities.textDocument.completion.completionItem.snippetSupport = false

	local function mason_lsp_handler(lsp_name)
		local ok, custom_handler = pcall(require, "plugins.completion.server." .. lsp_name)

		if not ok then
			nvim_lsp[lsp_name].setup({
				capabilities = opts.capabilities,
				on_attach = opts.on_attach,
			})
		elseif type(custom_handler) == "function" then
			custom_handler(opts)
		elseif type(custom_handler) == "table" then
			nvim_lsp[lsp_name].setup(vim.tbl_deep_extend("force", opts, custom_handler))
		end
	end

	mason_lspconfig.setup_handlers({ mason_lsp_handler })

	vim.api.nvim_command([[LspStart]])
end
