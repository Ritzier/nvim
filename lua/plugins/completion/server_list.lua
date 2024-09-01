local M = {}

M["lsp_list"] = {
	"bashls",
	"json-lsp",
	"lua_ls",
	"marksman",
	"taplo",
}

M["null_ls"] = {
	-- Formatter
	"black",
	"clang-format",
	"isort",
	"prettier",
	"prettierd",
	"stylua",
	"taplo",
	-- "rustfmt" -- Download with system

	-- Diagnostics

	-- Lint
}

return M
