local M = {}

function M.setup(on_attach, capabilities)
    local function custom_attach(client, bufnr)
        require("inlay-hints").on_attach(client, bufnr)
        on_attach(client, bufnr)
    end

    require("neodev").setup({
        library = {
            enabled = true,
            runtime = true,
            types = true,
            plugins = false,
        },
        setup_jsonls = true,
    })
    require("lspconfig").sumneko_lua.setup({
        on_attach = custom_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    disable = { "lowercase-global", "undefined-global", "unused-local", "unused-vararg", "trailing-space" },
                    globals = { "vim", "packer_plugins" }
                },
                workspace = {
                    library = {
                        vim.api.nvim_get_runtime_file("", true),
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                        plugins = { "neotest" },
                        types = true,
                    },
                    checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
                telemetry = {
                    enable = false
                },
                completion = {
                    callSnippet = "Replace"
                },
                hint = {
                    enable = true,
                    setType = true,
                },
                runtime = {
                    version = "LuaJIT",
                    path = vim.split(package.path, ";");
                }
            },
        },
    })
end

return M
