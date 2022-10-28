local M = {}

function M.setup(on_attach, capabilities)
    local copy_capabilities = capabilities
    copy_capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
    }

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

return M
