return {
	"mfussenegger/nvim-dap",
	config = require("modules.dap.dap"),
	lazy = true,
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
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = require("modules.dap.dapui"),
		},
	},
}
