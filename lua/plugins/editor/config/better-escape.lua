return function()
	require("better_escape").setup({
		timeout = vim.o.timeoutlen,
		default_mappings = true,
		mappings = {
			i = {
				h = {
					t = "<Esc>",
					h = "<Esc>",
				},
			},
			c = {
				h = {
					t = "<Esc>",
					h = "<Esc>",
				},
			},
			t = {
				h = {
					t = "<C-\\><C-n>",
				},
			},
			v = {
				h = {
					t = "<Esc>",
				},
			},
			s = {
				h = {
					t = "<Esc>",
				},
			},
		},
	})
end
