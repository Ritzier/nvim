return function(opts)
	-- Reenable for snippet support for HTML-lsp
	opts.capabilities.textDocument.completion.completionItem.snippetSupport = true

	require("lspconfig")["html"].setup({
		capabilities = opts.capabilities,
	})
end
