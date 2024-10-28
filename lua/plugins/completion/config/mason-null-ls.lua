return function()
	require("mason-null-ls").setup({
		ensure_installed = require("plugins.completion.server_list")["null_ls"],
		automatic_installation = true,
	})
end
