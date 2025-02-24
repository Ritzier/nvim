return function()
	require("better_escape").setup({
		timeout = vim.o.timeoutlen,
		default_mappings = true,
		mappings = {
			i = {
				h = {
					m = "<Esc>",
					h = "<Esc>",
				},
			},
			c = {
				h = {
					m = "<Esc>",
					h = "<Esc>",
				},
			},
			t = {
				h = {
					m = "<C-\\><C-n>",
				},
			},
			-- v = {
			-- 	h = {
			-- 		t = "<Esc>",
			-- 	},
			-- },
			s = {
				h = {
					m = "<Esc>",
				},
			},
		},
	})
end
