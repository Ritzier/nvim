return function()
	local nvim_lsp = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")
	require("lspconfig.ui.windows").default_options.border = "rounded"

	vim.diagnostic.config({
		reverity_sort = true,
		signs = true,
		underline = true,
		update_in_insert = false,
		virtual_text = false,
	})

	vim.fn.sign_define("DiagnosticSignError", { text = "●", texthl = "DiagnosticSignError" })
	vim.fn.sign_define("DiagnosticSignWarn", { text = "●", texthl = "DiagnosticSignWarn" })
	vim.fn.sign_define("DiagnosticSignInfo", { text = "●", texthl = "DiagnosticSignInfo" })
	vim.fn.sign_define("DiagnosticSignHint", { text = "●", texthl = "DiagnosticSignHint" })

	local opts = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
			})
		elseif type(custom_handler) == "function" then
			custom_handler(opts)
		elseif type(custom_handler) == "table" then
			nvim_lsp[lsp_name].setup(vim.tbl_deep_extend("force", opts, custom_handler))
		end
	end

	mason_lspconfig.setup_handlers({ mason_lsp_handler })

	-- INFO: Manually setup `ltex_plus`
	-- require("plugins.completion.server.ltex_plus")(opts)

	vim.api.nvim_command([[LspStart]])
end
