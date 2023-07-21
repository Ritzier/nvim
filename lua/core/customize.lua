local settings = {}

settings["servers"] = {
	"lua_ls",
	"bashls",
	"clangd",
	"cssls",
	"gopls",
	"html",
	"jsonls",
	"omnisharp",
	"pyright",
	"rust_analyzer",
	"yamlls",
	"zls",
	"vimls",
}

settings["null_ls"] = {
	-- formatting
	"black",
	"clang_format",
	"eslint_d",
	"jq",
	"markdownlint",
	"prettierd",
	"rustfmt",
	"shfmt",
	"stylua",

	-- diagnostics
	"shellcheck",
	-- "markdownlint",
}

settings["external_browser"] = "chrome-cli open"

return settings
