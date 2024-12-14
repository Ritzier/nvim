local M = {}

-- Add lsp server at here, and will be automate configure it or add custom configuration at ./server/`lsp`
M["lsp_list"] = {
	"bashls",
	"cssls",
	"jsonls",
	"lua_ls",
	"pylsp",
	"tailwindcss",
	"taplo",
	"yamlls",
	"ts_ls",
}

-- Automatic configuration by `mason-null-ls`
-- Manually handle formatter with `conform`
-- Modify configuration file `config/conform.lua`
M["null_ls"] = {
	-- Formatter
	"black",
	"clang-format",
	"djlint",
	"isort",
	"prettier",
	"prettierd",
	"stylua",
	"taplo",
	"yamlfmt",

	-- Linter
	"ruff",
}

return M
