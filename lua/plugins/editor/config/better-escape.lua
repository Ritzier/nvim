return function()
	require("better_escape").setup({
		timeout = vim.o.timeoutlen,
		default_mappings = true,
		mappings = {
			i = {
				h = {
					h = "<Esc>",
					t = "<Esc>",
				},
			},
			c = {
				h = {
					h = "<Esc>",
					t = "<Esc>",
				},
			},
			t = {
				h = {
					t = "<C-\\><C-n>",
				},
			},
			v = {},
			s = {},
		},
	})
end
