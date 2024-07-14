local list = {}

list["lsp_deps"] = {
	"bashls",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"pylsp",
	"marksman",
	"tsserver",
	-- use Rust's neovim plugin
	-- "rust-analyzer",
}

list["null_ls_deps"] = {
	"gofumpt",
	"goimports",
	"prettier",
	"shfmt",
	"stylua",
	"vint",
	"markdownlint",
}

list["dap_deps"] = {
	"codelldb", --C
	"delve",
	"python",
}

return list
