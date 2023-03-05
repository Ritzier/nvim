require("which-key").register({
	r = {
		name = "Rust",
		d = { "<cmd>RustDebuggables<CR>", "Debug" },
		c = { "<cmd>RustOpenCargo<CR>", "Open Cargo" },
		w = { "<cmd>RustReloadWorkspace<CR>", "Reload Workspace" },
		p = { "<cmd>RustPlay<CR>", "Rust Playground" },
		r = { "!cargo check<CR>", "Cargo Check" },
		f = { "<cmd>RustFmt<CR>", "Rust Format" },
		m = { "<cmd>RustExpandMacro<CR>", "Rust Expand Marcro" },
		e = { "<cmd>RustParentModule<CR>", "Rust ParentModule" },
		k = { "<cmd>RustHoverAction<CR>", "Rust HoverAction" },
	},

	w = {
		name = "Workspace",
		a = { ":lua vim.lsp.buf.add_workspace_folder", "Add WorkSpace Folder" },
		r = { ":lua vim.lsp.buf.remove_workspace_folder", "Remove WorkSpace Folder" },
		l = {
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"List Workspace Folder",
		},
	},
	f = { ":lua vim.lsp.buf.format()<CR>", "Format" },
	n = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
	e = { ":lua vim.diagnostic.open_float()<CR>", "Diagnostic Open Float" },
}, { prefix = "<space>", silent = true, noremap = true })
