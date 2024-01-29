return {
	{
		"mfussenegger/nvim-dap",
		cmd = {
			"DapSetLogLevel",
			"DapShowLog",
			"DapContinue",
			"DapToggleBreakpoint",
			"DapToggleRepl",
			"DapStepOver",
			"DapStepInto",
			"DapStepOut",
			"DapTerminate",
		},
		config = require("plugins.debugger.config"),
		dependencies = {
			"rcarriga/nvim-dap-ui",
			{ "jay-babu/mason-nvim-dap.nvim" },
			{ "theHamsta/nvim-dap-virtual-text" },
		},
	},
}
