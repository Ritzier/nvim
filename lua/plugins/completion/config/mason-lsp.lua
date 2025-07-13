return function()
	local lsp_list = require("plugins.completion.server_list").lsp_list

	require("lspconfig.ui.windows").default_options.border = "rounded"

	require("mason-lspconfig").setup({
		ensure_installed = lsp_list,
		automatic_enable = false,
	})

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

	vim.lsp.inlay_hint.enable(true)

	local function mason_lsp_handler(lsp_name)
		local ok, custom_handler = pcall(require, "plugins.completion.server." .. lsp_name)

		if not ok then
			vim.lsp.config(lsp_name, opts)
			vim.lsp.enable(lsp_name)
		elseif type(custom_handler) == "function" then
			custom_handler(opts)
			vim.lsp.enable(lsp_name)
		elseif type(custom_handler) == "table" then
			vim.lsp.enable(lsp_name)
		end
	end

	-- INFO: Manually setup `ltex_plus`
	-- require("plugins.completion.server.ltex_plus")(opts)

	for _, lsp in ipairs(lsp_list) do
		mason_lsp_handler(lsp)
	end
end
