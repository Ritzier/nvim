require("modules.lsp.lsputils")

-- require("modules.lsp.config-old")
require("modules.lsp.config")

require("modules.lsp.docs_view")

require("fidget").setup({})

require("modules.lsp.lsp_line")

require("modules.lsp.lsp_colors")

require("modules.lsp.trouble")

require("modules.lsp.lspsaga")

require("modules.lsp.cmp")

require("modules.lsp.inc_rename")

require("modules.lsp.goto_preview")

-- require("modules.lsp.lsputils")

require("modules.lsp.luasnip")

require("modules.lsp.format")

require("modules.lsp.wk")

vim.diagnostic.config({
	virtual_text = {
        prefix = "●" -- Could be '●', '▎', 'x'
    },
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

