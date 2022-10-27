local servers = {
	"efm",
	"sumneko_lua",
	"volar",
	"pyright",
	"html",
	"cssls",
	"flow",
	"graphql",
	"quick_lint_js",
	"svelte",
	"tailwindcss",
	"tsserver",
	"bashls",
	"rust_analyzer",
	"clangd",
	"omnisharp",
	"dartls",
	"cmake",
	"zls",
  "jsonls",
}

require("lsp-config.lsp").setup(servers)

require("lsp-config.mason").setup()
