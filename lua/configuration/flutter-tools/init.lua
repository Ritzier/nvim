require("flutter-tools").setup({
    ui = {
        border = "rounded",
        notification_style = "plugin",
    },
    decorations = {
        statusline = {
            app_version = true,
            device = true,
        }
    },
    debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
        register_configurations = function(paths)
            require("dap-config.flutter").setup()
        end
    },
    outline = { auto_open = false },
    widget_guides = { enabled = true, debug = true },
    dev_log = { enabled = false, open_cmd = "tabedit" },
    lsp = {
        color = {
            enabled = true,
            background = true,
            virtual_text = false,
        },
        settings = {
            showTodos = true,
            renameFilesWithClasses = "prompt",
        },
        on_attach = require("lsp-config.servers.on_attach").on_attach,
        capabilities = require("lsp-config.servers.capabilities").capabilities,
    },
})
