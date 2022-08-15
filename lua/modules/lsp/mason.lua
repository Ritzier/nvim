local M = {}

function M.Mason_setup(servers)
    require("mason").setup({
        ui = {
            icons = {
                check_outdated_packages_on_open = true,
                border = "none",
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
    require("mason-lspconfig").setup({
        ensure_installed = servers
    })
    require("mason-tool-installer").setup({
        ensure_installed = {
            "shellcheck",
            "shfmt",
            "cpplint",
            "prettier",
            "hadolint",
            "goimports",
            "xo",
            "stylua",
            "flake8",
            "black",
            "vint",
            "rubocop",
        },
        auto_update = true,
        run_on_start = true,
    })
end

return M
