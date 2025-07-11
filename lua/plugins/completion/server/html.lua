return function(opts)
	-- Reenable for snippet support for HTML-lsp
	opts.capabilities.textDocument.completion.completionItem.snippetSupport = true

	vim.lsp.config("html", {
		capabilities = opts.capabilities,
	})
end
