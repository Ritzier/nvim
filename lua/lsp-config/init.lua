local servers = {
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
	"efm",
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

require("lsp-config.handlers").setup()

require("lsp-config.mason").setup()

require("lsp-config.mappings")
