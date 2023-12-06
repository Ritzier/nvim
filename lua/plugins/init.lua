return {

	"nvim-lua/plenary.nvim",

	"MunifTanjim/nui.nvim",

	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({})
		end,
	},

	{ "yamatsum/nvim-nonicons", config = true, enabled = false },

	{ "tpope/vim-repeat", event = "VeryLazy" },

	{ "nacro90/numb.nvim", event = "BufReadPre", config = true },

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {
			input = { relative = "editor" },
			select = {
				backend = { "telescope", "fzf", "builtin" },
			},
		},
	},

	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = {
			-- background_colour = "#A3CCBE",
			timeout = 1000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			render = "default",
			fps = 30,
		},
		config = function(_, opts)
			require("notify").setup(opts)
			vim.notify = require("notify")
		end,
	},

	{
		"andymass/vim-matchup",
		event = { "BufReadPost" },
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},

	{ "tpope/vim-surround", event = "BufReadPre", enabled = false },

	{
		"kylechui/nvim-surround",
		event = "BufReadPre",
		opts = {},
	},

	{
		"numToStr/Comment.nvim",
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				config = function()
					require("ts_context_commentstring").setup({
						enable_autocmd = true,
					})
				end,
			},
		},
		keys = { { "gc", mode = { "n", "v" } }, { "gcc", mode = { "n", "v" } }, { "gbc", mode = { "n", "v" } } },
		config = function(_, _)
			local opts = {
				ignore = "^$",
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
			require("Comment").setup(opts)
		end,
	},

	-- session management
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
        -- stylua: ignore
        keys = {
            { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
            { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
            { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
        },
	},

	{
		"max397574/better-escape.nvim",
		enabled = true,
		event = "InsertEnter",
		config = function()
			require("better_escape").setup({
				mapping = { "jk" },
			})
		end,
	},

	{
		"lambdalisue/suda.vim",
		event = "CmdlineEnter",
	},

	{
		"uga-rosa/ccc.nvim",
		event = { "BufReadPre", "BufReadPost" },
		config = function()
			local ccc = require("ccc")
			ccc.setup({
				alpha_show = "show",
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
				convert = {
					{ ccc.picker.hex, ccc.output.css_oklch },
					{ ccc.picker.css_rgb, ccc.output.css_oklch },
					{ ccc.picker.css_hsl, ccc.output.css_oklch },
				},
				inputs = {
					ccc.input.rgb,
					ccc.input.hsl,
					ccc.input.hwb,
					ccc.input.lab,
					ccc.input.lch,
					ccc.input.oklab,
					ccc.input.oklch,
					ccc.input.cmyk,
					ccc.input.hsluv,
					ccc.input.okhsl,
					ccc.input.hsv,
					ccc.input.okhsv,
					ccc.input.xyz,
				},
			})
		end,
	},
}
