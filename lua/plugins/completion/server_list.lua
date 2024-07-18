local list = {}

list["lsp_deps"] = {
	"bashls",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"pylsp",
	"taplo",
	"tsserver",
	-- use Rust's neovim plugin
	-- "rust-analyzer",
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
	"codelldb", --C
	"delve",
	"python",
}

return list
