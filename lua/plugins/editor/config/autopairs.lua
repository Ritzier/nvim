return function()
	local nap = require("nvim-autopairs")
	local rule = require("nvim-autopairs.rule")
	local cond = require("nvim-autopairs.conds")
	local utils = require("nvim-autopairs.utils")

	nap.setup({
		map_cr = true,
		fast_wrap = {
			manual_position = true
		},
	})

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

	-- nap.add_rules({
	-- 	rule("<", ">")
	-- 		:with_pair(cond.none)
	-- 		-- :with_move(cond.not_after_regex(">"))
	-- })

	nap.add_rules({
		rule("<", ">")
			:with_pair(cond.is_bracket_line())
			:with_move(cond.is_bracket_line_move())
	})

	local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
	nap.add_rules {
		-- Rule for a pair with left-side ' ' and right side ' '
		rule(' ', ' ')
		-- Pair will only occur if the conditional function returns true
			:with_pair(function(opts)
				-- We are checking if we are inserting a space in (), [], or {}
				local pair = opts.line:sub(opts.col - 1, opts.col)
				return vim.tbl_contains({
					brackets[1][1] .. brackets[1][2],
					brackets[2][1] .. brackets[2][2],
					brackets[3][1] .. brackets[3][2]
				}, pair)
			end)
			:with_move(cond.none())
			:with_cr(cond.none())
		-- We only want to delete the pair of spaces when the cursor is as such: ( | )
			:with_del(function(opts)
				local col = vim.api.nvim_win_get_cursor(0)[2]
				local context = opts.line:sub(col - 1, col + 2)
				return vim.tbl_contains({
					brackets[1][1] .. '  ' .. brackets[1][2],
					brackets[2][1] .. '  ' .. brackets[2][2],
					brackets[3][1] .. '  ' .. brackets[3][2]
				}, context)
			end)
	}
	for _, bracket in pairs(brackets) do
		nap.add_rules {
			multiline_close_jump(bracket[1], bracket[2]),
			-- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
			rule(bracket[1] .. ' ', ' ' .. bracket[2])
				:with_pair(cond.none())
				:with_move(function(opts) return opts.char == bracket[2] end)
				:with_del(cond.none())
				:use_key(bracket[2])
			-- Removes the trailing whitespace that can occur without this
				:replace_map_cr(function(_) return '<C-c>2xi<CR><C-c>O' end)
		}
	end
end
