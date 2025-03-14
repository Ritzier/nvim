return function()
	local npairs = require("nvim-autopairs")
	local Rule = require("nvim-autopairs.rule")
	local ts_conds = require("nvim-autopairs.ts-conds")
	local cond = require("nvim-autopairs.conds")
	local utils = require("nvim-autopairs.utils")

	npairs.setup({
		check_ts = false,
		map_cr = true,
		fast_wrap = {
			map = "<M-e>",
			chars = { "{", "[", "(", '"', "'" },
			pattern = [=[[%'%"%>%]%)%}%,]]=],
			end_key = "$",
			before_key = "h",
			after_key = "l",
			cursor_pos_before = true,
			keys = "qwertyuiopzxcvbnmasdfghjkl",
			manual_position = true,
			highlight = "Search",
			highlight_grey = "Comment",
		},
	})

	-- npairs.add_rule(Rule("<", ">", "rust"):with_pair(function()
	-- 	-- Add your regex logic here to check for 'if' or 'match'
	-- 	local line = vim.api.nvim_get_current_line()
	-- 	if line:match("^%s*if") or line:match("^%s*match") then
	-- 		return false
	-- 	end
	-- 	return true
	-- end):with_move(function(opts)
	-- 	return opts.char == ">"
	-- end))

	npairs.add_rules({
		-- Not working
		Rule("<", ">", "rust")
			:with_pair(ts_conds.is_not_ts_node({ "if_statement", "match_statement" }))
			:with_move(function(opts)
				return opts.char == ">"
			end),
	})

	-- Single quote for life time
	npairs.get_rule("'")[2]:with_pair(ts_conds.is_not_ts_node({ "type_arguments", "bounded_type" }))

	local function multiline_close_jump(open, close)
		return Rule(close, "")
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

				if nextrow < vim.api.nvim_buf_line_count(0) and vim.regex("^\\s*" .. close):match_line(0, nextrow) then
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
				local action = vim.regex("^" .. close):match_line(0, row + 1) and "a" or ("0f%sa"):format(opts.char)
				return ("<esc>xj%s"):format(action)
			end)
	end

	npairs.add_rules({
		multiline_close_jump("(", ")"),
		multiline_close_jump("[", "]"),
		multiline_close_jump("{", "}"),
	})
end
