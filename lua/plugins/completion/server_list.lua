local M = {}

-- Add lsp server at here, and will be automate configure it or add custom configuration at ./server/`lsp`
M["lsp_list"] = {
	"bashls",
	"cssls",
	"jsonls",
	"lua_ls",
	"marksman",
	--"pylsp",
	"pyright",
	"tailwindcss",
	"taplo",
	"yamlls",
	"ts_ls",
}

-- Automate download, but need for
-- modify formatter at ./config/conform.lua
-- modify lint and diagnostic at ./config/nonels.lua
M["null_ls"] = {
	-- Formatter
	"black",
	"clang-format",
	"isort",
	"prettier",
	"prettierd",
	"stylua",
	"taplo",
	"yamlfmt",
	-- "rustfmt" -- Download with system

	-- Diagnostics

	-- Lint
	"ruff",
	"shellharden",
}

return M
