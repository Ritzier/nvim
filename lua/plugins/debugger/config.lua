return function()
	require("plugins.debugger.dapui")
	require("plugins.debugger.dap-virtual-text")

	local dap, dapui = require("dap"), require("dapui")
	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end

	vim.fn.sign_define("DapBreakpoint", { text = "󰝥", texthl = "DapBreakpoint", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointCondition", { text = "󰟃", texthl = "DapBreakpoint", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
	vim.fn.sign_define("DapLogPoint", { text = "", linehl = "", numhl = "" })

	local mason_dap = require("mason-nvim-dap")
	mason_dap.setup({
		ensure_installed = { "codelldb" },
		automatic_installation = true,
		handlers = {
			function(config)
				local dap_name = config.name
				local ok, custom_handler = pcall(require, "plugins.debugger.client." .. dap_name)
				if not ok then
					mason_dap.default_setup(config)
				else
					custom_handler(config)
				end
			end,
		},
	})
end
