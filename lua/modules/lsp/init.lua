local servers = {
	"angularls",
	"arduino_language_server",
	"bashls",
	"clangd",
	"cssls",
	"clangd",
	"cmake",
	"dartls",
	"dotls",
	"gopls",
	"dockerls",
	"html",
	"jdtls",
	"jsonls",
	"julials",
	"pyright",
	"rust_analyzer",
	"kotlin_language_server",
	"sourcekit",
	"sumneko_lua",
	"tailwindcss",
	"tsserver",
	"omnisharp",
}

require("modules.lsp.mason").Mason_setup(servers)

require("modules.lsp.config").setup(servers)

require("modules.lsp.completion")

require("modules.lsp.efm")

require("fidget").setup()

require("modules.lsp.lspsaga")

require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

vim.diagnostic.config({
	virtual_text = {
        prefix = "●" -- Could be '●', '▎', 'x'
    },
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})
