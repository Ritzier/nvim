local M = {}
local script = require("core.script")

function M.setup()
    if script.check("lspconfig") then
        M.config()
    end
end

function M.config()
    local lsp_servers = {
        "arduino_language_server",
        "bashls",
        "ccls",
        "cmake",
        "omnisharp",
        "gopls",
        "pyright",
        "tailwindcss",
        "sumneko_lua",
        "rust_analyzer",
        "vimls",
        "sqlls",
    }

    local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    end
    local lsp_flags = {
        debounce_text_changes = 150,
    }

    for _, server in ipairs(lsp_servers) do
        if server == "sumneko_lua" then
            require("lspconfig")[server].setup({
                on_attach = on_attach,
                flags = lsp_flags,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'},
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    }
                }
            })
        elseif server == "arduino_language_server" then
            require("lspconfig")[server].setup({
                cmd = {
                    "arduino-language-server",
                    "-cli", "/usr/bin/arduino-cli",
                },
                on_attach = on_attach,
                flags = lsp_flags
            })
        elseif server == "omnisharp" then
            local pid = vim.fn.getpid()
            local omnisharp_bin = "/usr/bin/omnisharp"
             require("lspconfig")[server].setup({
                on_attach = on_attach,
                flags = lsp_flags,
                cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
             })
        else
            require("lspconfig")[server].setup({
                on_attach = on_attach,
                flags = lsp_flags
            })
        end
    end
end

M.setup()
