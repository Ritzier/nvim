return function()
	require("better_escape").setup({
		timeout = vim.o.timeoutlen,
		default_mappings = true,
		mappings = {
			i = {
				j = {
					k = "<Esc>",
					j = "<Esc>",
				},
			},
			c = {
				j = {
					k = "<Esc>",
					j = "<Esc>",
				},
			},
			t = {
				j = {
					k = "<C-\\><C-n>",
				},
			},
			-- v = {
			-- 	h = {
			-- 		t = "<Esc>",
			-- 	},
			-- },
			s = {
				j = {
					k = "<Esc>",
				},
			},
		},
	})
end
