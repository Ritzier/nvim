return function()
	local nvim_lsp = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")
	require("lspconfig.ui.windows").default_options.border = "rounded"

	vim.diagnostic.config({
		virtual_text = {
			source = "if_many",
			prefix = "● ",
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
			},
			linehl = {
				[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			},
			numhl = {
				[vim.diagnostic.severity.WARN] = "WarningMsg",
			},
		},
	})

	local opts = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = require("keymaps.lsp").on_attach,
	}

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
