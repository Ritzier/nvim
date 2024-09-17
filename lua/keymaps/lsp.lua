local a = {}
function a:on_attach(bufnr)
	require("better-diagnostic-virtual-text.api").setup_buf(bufnr, {
		ui = {
			wrap_line_after = false, -- wrap the line after this length to avoid the virtual text is too long
			left_kept_space = 3, --- the number of spaces kept on the left side of the virtual text, make sure it enough to custom for each line
			right_kept_space = 3, --- the number of spaces kept on the right side of the virtual text, make sure it enough to custom for each line
			arrow = "  ",
			up_arrow = "  ",
			down_arrow = "  ",
			above = false, -- the virtual text will be displayed above the line
		},
		priority = 2003, -- the priority of virtual text
		inline = false,
	})

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
