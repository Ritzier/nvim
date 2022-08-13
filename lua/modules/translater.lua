require("translate").setup({
	default = {
		command = "translate_shell",
	},
	preset = {
		output = {
			split = {
				append = true,
			},
		},
	},
})

require("which-key").register({
	c = {
		name = "Code",
		t = { ":Translate ZH -source=EN -output=register<cr>", "Translate English word to Chinese in float window" },
	},
}, { prefix = "<leader>" })
