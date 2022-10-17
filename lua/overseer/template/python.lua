return {
	name = "Run File",
	builder = function()
		local file = vim.fn.expand("%:p")
		return {
			cmd = { "python3" },
			args = { file },
			-- components = { { "on_output_quickfix", open = true }, "default" },
		}
	end,
	condition = {
		filetype = { "python" }
	}
}
