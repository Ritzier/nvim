return function()
	require("plugins.lsp.mason")()
	require("plugins.lsp.settings")()
	require("plugins.lsp.null_ls")()

	local servers = require("plugins.lsp.servers_list")

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	local on_attach = function(client, bufnr)
		-- lsp_signature
		require("lsp_signature").on_attach({
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		}, bufnr)

		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr")

		if client.server_capabilities.definitionProvider then
			vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
		end

		require("keymaps.lsp")(bufnr)
	end

	local on_attach_rust = function(client, bufnr)
		-- lsp_signature
		require("lsp_signature").on_attach({
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		}, bufnr)

		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr")

		if client.server_capabilities.definitionProvider then
			vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
		end
		vim.keymap.set("n", "<C-space>", require('rust-tools').hover_actions.hover_actions, { buffer = bufnr })
		-- Code action groups
		vim.keymap.set("n", "<Leader>a", require('rust-tools').code_action_group.code_action_group, { buffer = bufnr })

		require("keymaps.lsp")(bufnr)
	end
	-- for _, server in ipairs(servers) do
	-- 	local ok, handler = pcall(require, "plugins.lsp.servers." .. server)
	-- 	if not ok then
	-- 		lspconfig[server].setup(on_attach, capabilities)
	-- 	else
	-- 		handler(on_attach, capabilities)
	-- 	end
	-- end

	for _, server in ipairs(servers) do
		local ok, handler = pcall(require, "plugins.lsp.servers." .. server)
		if not ok then
			require("lspconfig")[server].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
        elseif server == "rust_analyzer" then
            handler(on_attach_rust, capabilities)
		else
			handler(on_attach, capabilities)
		end
	end
end
