return {
	{
		"ritzier/autoclose.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		config = require("plugins.pairs.config.autoclose"),
	},
}
