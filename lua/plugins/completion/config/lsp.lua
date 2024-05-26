return function()
	require("plugins.completion.config.mason").setup()
	require("plugins.completion.config.mason-lspconfig").setup()

	vim.api.nvim_command([[LspStart]])
end
