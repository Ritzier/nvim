return function()
	local null_ls = require("null-ls")
	null_ls.setup()

	require("mason-null-ls").setup({
		ensure_installed = require("plugins.completion.server_list")["null_ls"],
		automatic_installation = true,
		methods = {
			diagnostics = true,
			formatting = false,
			code_actions = true,
			completion = true,
			hover = true,
		},
		handlers = {},
	})
end
