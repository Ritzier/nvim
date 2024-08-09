local list = {}

list["lsp_deps"] = {
	"bashls",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"pbls",
	"taplo",
	"tsserver",
}

list["null_ls_deps"] = {
	"gofumpt",
	"goimports",
	"markdownlint",
	"prettier",
	"shfmt",
	"stylua",
	"vint",
}

list["dap_deps"] = {
	"codelldb",
	"delve",
	"python",
}

return list
