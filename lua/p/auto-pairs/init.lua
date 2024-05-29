return {

	{
		"jiangmiao/auto-pairs",
		enabled = false,
		lazy = false,
		event = "InsertEnter",
		config = function()
			vim.cmd([[
      let g:AutoPairsShortcutFastWrap = '<M-e>'
      let g:AutoPairsFlyMode = 1
      ]])
		end,
	},

	{
		"altermo/ultimate-autopair.nvim",
		enabled = false,
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recommended as each new version will have breaking changes
		config = function()
			require("ultimate-autopair").setup({
				extensions = { fly = { nofilter = true, only_jump_end_pair = true } },
				config_internal_pairs = {
					{ '"', '"', fly = true },
					{ "'", "'", fly = true },
					{ "`", "`", newline = true },
				},
			})
		end,
	},

	{
		"LunarWatcher/auto-pairs",
		enabled = false,
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			vim.cmd([[
            let g:AutoPairsFlyMode = 1
            let g:AutoPairsShortcutFastWrap = '<M-e>'
            ]])
		end,
	},

	{
		"m4xshen/autoclose.nvim",
		enabled = false,
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			require("autoclose").setup({
				keys = {
					["("] = { escape = false, close = true, pair = "()" },
					["["] = { escape = false, close = true, pair = "[]" },
					["{"] = { escape = false, close = true, pair = "{}" },

					["<"] = { escape = true, close = true, pair = "<>", enabled_filetypes = { "rust" } },
					[">"] = { escape = true, close = false, pair = "<>" },
					[")"] = { escape = true, close = false, pair = "()" },
					["]"] = { escape = true, close = false, pair = "[]" },
					["}"] = { escape = true, close = false, pair = "{}" },

					['"'] = { escape = true, close = true, pair = '""' },
					["`"] = { escape = true, close = true, pair = "``" },
					["'"] = { escape = true, close = true, pair = "''", disabled_filetypes = { "rust" } },
				},
				options = {
					disable_when_touch = false,
				},
			})
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			local nap = require("nvim-autopairs")
			local rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			local utils = require("nvim-autopairs.utils")

			local function multiline_close_jump(open, close)
				return rule(close, "")
				    :with_pair(function()
					    local row, col = utils.get_cursor(0)
					    local line = utils.text_get_current_line(0)

					    if #line ~= col then --not at EOL
						    return false
					    end

					    local unclosed_count = 0
					    for c in line:gmatch("[\\" .. open .. "\\" .. close .. "]") do
						    if c == open then
							    unclosed_count = unclosed_count + 1
						    end
						    if unclosed_count > 0 and c == close then
							    unclosed_count = unclosed_count - 1
						    end
					    end
					    if unclosed_count > 0 then
						    return false
					    end

					    local nextrow = row + 1

					    if
					        nextrow < vim.api.nvim_buf_line_count(0)
					        and vim.regex("^\\s*" .. close):match_line(0, nextrow)
					    then
						    return true
					    end
					    return false
				    end)
				    :with_move(cond.none())
				    :with_cr(cond.none())
				    :with_del(cond.none())
				    :set_end_pair_length(0)
				    :replace_endpair(function(opts)
					    local row, _col = utils.get_cursor(0)
					    local action = vim.regex("^" .. close):match_line(0, row + 1) and "a"
					        or ("0f%sa"):format(opts.char)
					    return ("<esc>xj%s"):format(action)
				    end)
			end

			nap.setup({ map_cr = true })

			nap.add_rules({
				multiline_close_jump("(", ")"),
				multiline_close_jump("[", "]"),
				multiline_close_jump("{", "}"),
			})
		end,
	},

	{
		"abecodes/tabout.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		-- lazy = false,
		config = function()
			require("tabout").setup({
				tabkey = "", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "", -- key to trigger backwards tabout, set to an empty string to disable

				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				enable_backwards = true,
				completion = false, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				ignore_beginning = true, -- if the cursor is at the beginning of a filled element it will rather tab out than shift the content
				exclude = {}, -- tabout will ignore these filetypes
			})
		end,
		requires = { "nvim-treesitter/nvim-treesitter" },
		-- event = "InsertCharPre",
	},
}
