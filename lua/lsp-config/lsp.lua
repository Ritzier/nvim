local M = {}

local on_attach = require("lsp-config.servers.on_attach").on_attach
local capabilities = require("lsp-config.servers.capabilities").capabilities

local function set_server(name, attach, capabilitie)
    require("lsp-config.servers." .. name).setup(attach, capabilitie)
end

function M.setup(servers)
    for _, server in ipairs(servers) do
        if server == "sumneko_lua" then
            -- set_server("sumneko_lua", on_attach, capabilities)
            require("lspconfig")["sumneko_lua"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim", "packer_plugins" } },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                            },
                            maxPreload = 100000,
                            preloadFileSize = 10000,
                        },
                        telemetry = { enable = false },
                        -- Do not override treesitter lua highlighting with sumneko lua highlighting
                        semantic = { enable = false },
                    },
                },
            })

        elseif server == "gopls" then
            set_server("gopls", on_attach, capabilities)

        elseif server == "efmls-configs" then
            require("efmls-configs").init({
                on_attach = on_attach,
                capabilities = capabilities,
                init_options = { documentFormatting = true, codeAction = true },
            })

        elseif server == "efm" then
            require("lspconfig").efm.setup({
                on_attach = on_attach,
                init_options = { documentFormatting = true },
                settings = {
                    languages = require("lsp-config.efm"),
                },
            })

        elseif server == "omnisharp" then
            set_server("omnisharp", on_attach, capabilities)

        elseif server == "cssls" then
            set_server("cssls", on_attach, capabilities)

        elseif server == "html" then
            set_server("html", on_attach, capabilities)

        elseif server == "clangd" then
            set_server("clangd", on_attach, capabilities)

        elseif server == "yamlls" then
            set_server("yamlls", on_attach, capabilities)

        elseif server == "jsonls" then
            set_server("jsonls", on_attach, capabilities)

        elseif server == "rust_analyzer" then
            set_server("rust_analyzer", on_attach, capabilitie)

        elseif server == "bashls" then
            set_server("bashls", on_attach, capabilities)

        elseif server == "pyright" then
            set_server("pyright", on_attach, capabilities)

        else
            require("lspconfig")[server].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

        end
    end
end

return M
