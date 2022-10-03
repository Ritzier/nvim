local M = {}

local keymap = vim.keymap.set
local navic = require("nvim-navic")

function M.on_attach(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	local opts = { noremap = true, silent = true }

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	keymap("n", "K", vim.lsp.buf.hover, bufopts)
	keymap("n", "<space>e", vim.diagnostic.open_float, bufopts)
	keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", bufopts)
	keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", bufopts)
	keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", bufopts)
	keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", bufopts)
	keymap("n", "<space>f", ":lua vim.lsp.buf.format()<CR>", bufopts)

	keymap("n", "<space>ln", "<cmd>Lspsaga rename<CR>", bufopts)

	if client.server_capabilities.definitionProvider then
		vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
	end

	if client.name ~= "efm" then
		require("nvim-navic").attach(client, bufnr)
		require("lualine").setup({
			sections = {
				lualine_c = {
					{ navic.get_location, cond = navic.is_available },
				},
			},
		})
	end

end

return M
