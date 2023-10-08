require("which-key").register({
	r = {
		name = "Refactoring",

		i = {
			function()
				require("refactoring").refactor("Inline Variable")
			end,
			"Inline Variable",
		},

		b = {
			function()
				require("refactoring").refactor("Exract Block")
			end,
			"Extract Block",
		},
		f = {
			function()
				require("refactoring").refactor("Exract Block To File")
			end,
			"Extract Block to File",
		},

		P = {
			function()
				require("refactoring").debug.printf({ below = false })
			end,
			"Debug Print",
		},

		p = {
			function()
				require("refactoring").debug.print_var({ normal = true })
			end,
			"Debug Print Variable",
		},

		c = {
			function()
				require("refactoring").debug.cleanup({})
			end,
			"Debug Cleanup",
		},
	},
}, { mode = "n", prefix = "<leader>", silent = true })

require("which-key").register({
	r = {
		name = "Refactoring",
		s = {
			function()
				require("telescope").extensions.refactoring.refactors()
			end,
			"Refactor",
		},

		i = {
			function()
				require("refactoring").refactor("Inline Variable")
			end,
			"Inline Variable",
		},

		f = {
			function()
				require("refactoring").refactor("Extract Function")
			end,
			"Extract Function",
		},

		F = {
			function()
				require("refactoring").refactor("Extract Function to File")
			end,
			"Extract Function to File",
		},

		x = {
			function()
				require("refactoring").refactor("Extract Variable")
			end,
			"Extract Variable",
		},

		p = {
			function()
				require("refactoring").debug.print_var({})
			end,
			"Debug Print Variable",
		},
	},
}, { mode = "v", prefix = "<leader>", silent = true })
