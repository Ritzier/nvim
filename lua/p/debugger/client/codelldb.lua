return function()
	local dap = require("dap")
	local utils = require("utils")

	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = vim.fn.exepath("codelldb"),
			args = { "--port", "${port}" },
		},
	}

	dap.configurations.c = {
		{
			name = "LLDB: Launch",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {},
			console = "integratedTerminal",
		},
		{
			name = "Debug",
			type = "codelldb",
			request = "launch",
			program = utils.input_exec_path(),
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			terminal = "integrated",
		},
		{
			name = "Debug (with args)",
			type = "codelldb",
			request = "launch",
			program = utils.input_exec_path(),
			args = utils.input_args(),
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			terminal = "integrated",
		},
		{
			name = "Attach to a running process",
			type = "codelldb",
			request = "attach",
			program = utils.input_exec_path(),
			stopOnEntry = false,
			waitFor = true,
		},
	}
	dap.configurations.cpp = dap.configurations.c
	dap.configurations.rust = dap.configurations.c
	-- dap.configurations.rust = {
	-- 	{
	-- 		name = "Rust debug",
	-- 		type = "codelldb",
	-- 		request = "launch",
	-- 		program = function()
 --                vim.fn.jobstart("cargo build")
	-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
	-- 		end,
	-- 		cwd = "${workspaceFolder}",
	-- 		stopOnEntry = true,
	-- 	},
	-- }
end
