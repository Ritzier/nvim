return function(on_attach, capabilities)
    local copy_capabilities = capabilities
    -- copy_capabilities.textDocument.completion.completionItem.snippetSupport = true

    local function copy_attach(client, bufnr)
        on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
    end

    require("lspconfig")["cssls"].setup({
        on_attach = copy_attach,
        capabilities = copy_capabilities,
    })
end
