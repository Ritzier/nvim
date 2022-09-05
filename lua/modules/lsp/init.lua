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
	"sumneko_lua",
	"tailwindcss",
	"tsserver",
	"omnisharp",
}

require("modules.lsp.mason").Mason_setup(servers)

--[[ for _, server in ipairs(servers) do ]]
--[[ 	if server == "sumneko_lua" or server=="rust_analyzer" then ]]
--[[ 		require("lspconfig")[server].setup({ }) ]]
--[[ 	end ]]
--[[ end ]]

require("modules.lsp.config").setup(servers)

require("modules.lsp.completion")

require("modules.lsp.efm")

require("fidget").setup()

require("modules.lsp.lspsaga")

require("modules.lsp.wk")

require("modules.lsp.cmp-npm")

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

require("modules.lsp.luasnip")
