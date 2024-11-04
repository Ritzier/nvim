-- /home/stevearc/.config/nvim/lua/overseer/template/user/run_script.lua
return {
	name = "run script",
	builder = function()
		local file = vim.fn.expand("%:p")
		return {
			cmd = { "python" },
			args = { file },
			components = {
				{ "on_output_quickfix", set_diagnostics = true },
				"on_result_diagnostics",
				"default",
			},
		}
	end,
	condition = {
		filetype = { "python" },
	},
}
