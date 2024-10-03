local a = {}
function a:on_attach(bufnr)
	-- local function map(mode, l, r, opts)
	-- 	opts = opts or {}
	-- 	opts.buffer = bufnr
	-- 	opts.noremap = true
	-- 	opts.silent = true
	-- 	vim.keymap.set(mode, l, r, opts)
	-- end

	-- map("n", "<space>wa", ":lua vim.lsp.buf.add_workspace_folder<CR>", { desc = "Add Workspace" })
	-- map("n", "<space>wr", ":lua vim.lsp.buf.remove_workspace_folder<CR>", { desc = "Add Workspace" })
	-- map("n", "<space>wl", ":lua vim.lsp.buf.list_workspace_folders()<CR>", { desc = "List Workspace" })
	-- map("n", "<space>e", ":lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostic Open Float" })

	-- local wk = require("which-key")
	-- wk.add({
	-- 	{
	-- 		mode = { "n" },
	-- 		{ "<space>w", group = "workspace" },
	-- 		{ "<space>wa", ":lua vim.lsp.buf.add_workspace_folder", desc = "Add Workspace Folder" },
	-- 		{ "<space>wr", ":lua vim.lsp.buf.remove_workspace_folder", desc = "Remove Workspace Folder" },
	-- 		{
	-- 			"<space>wl",
	-- 			function()
	-- 				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- 			end,
	-- 			desc = "List Workspace Folder",
	-- 		},
	-- 		{ "<space>n", ":lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
	-- 		-- { "<space>e", ":lua vim.diagnostic.open_float()<CR>", desc = "Diagnostic Open Float" },
	-- 	},
	-- })
end

return a
