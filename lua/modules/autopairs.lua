require("nvim-autopairs").setup({})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
local handlers = require("nvim-autopairs.completion.handlers")
cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done({
		filetypes = {
			["*"] = {
				["("] = {
					kind = {
						cmp.lsp.CompletionItemKind.Function,
						cmp.lsp.CompletionItemKind.Method,
					},
					handler = handlers["*"],
				},
			},
			tex = false,
		},
	})
)
