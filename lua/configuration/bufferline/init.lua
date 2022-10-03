require("bufferline").setup({
	options = {
		hover = {
			enabled = true,
			delay = 200,
			reveal = {'close'}
		},
		groups = {
			items = {
				require('bufferline.groups').builtin.pinned:with({ icon = "" })
			}
		},
		modified_icon = "●",
		indicator = {
			style = "underline"
		},
	},
	highlights = {
		indicator_selected = {sp="#eb6f92"},
		buffer_selected = {sp="#eb6f92"},
	}
})
