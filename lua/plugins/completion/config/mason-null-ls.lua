local M = {}

function M.setup()
	local null_ls = require("null-ls")
	null_ls.setup()

	require("mason-null-ls").setup({
		ensure_installed = require("plugins.completion.server_list").null_ls_deps,
		automatic_installation = true,
		automatic_setup = true,
		methods = {
			diagnostics = true,
			formatting = true,
			code_actions = true,
			completion = true,
			hover = true,
		},
		handlers = {},

	})
end

return M
