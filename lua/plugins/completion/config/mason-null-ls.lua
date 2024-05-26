local M = {}

function M.setup()
	require("mason-null-ls").setup({
		ensure_installed = require("plugins.completion.server_list").null_ls_deps,
		automatic_installation = false,
		automatic_setup = true,
		handlers = {},
	})
end

return M
