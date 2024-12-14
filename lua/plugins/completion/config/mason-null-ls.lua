return function()
	local null_ls = require("null-ls")
	null_ls.setup()

	require("mason-null-ls").setup({
		ensure_installed = require("plugins.completion.server_list")["null_ls"],
		automatic_installation = true,
		handlers = {},
	})
end
