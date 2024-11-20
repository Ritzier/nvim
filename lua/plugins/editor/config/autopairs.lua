return function()
	local npairs = require("nvim-autopairs")
	local Rule = require("nvim-autopairs.rule")
	local ts_conds = require("nvim-autopairs.ts-conds")
	local cond = require("nvim-autopairs.conds")
	local utils = require("nvim-autopairs.utils")

	npairs.setup({
		check_ts = true,
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

	-- Existing Rust-specific rule
	npairs.add_rule(Rule("<", ">", "rust"):with_pair(function(opts)
		local bufnr = opts.bufnr

		local function is_in_view_macro()
			local current_linenr = vim.api.nvim_win_get_cursor(0)[1]

			for i = current_linenr, 1, -1 do
				local line_content = vim.api.nvim_buf_get_lines(bufnr, i - 1, i, false)[1]

				if line_content:match("view!%s*{") then
					return true
				end

				if line_content:match("%s*}") then
					break
				end
			end

			return false
		end

		if is_in_view_macro() then
			return false
		end

		-- ::<> for turbofish
		local row, col = utils.get_cursor(0)
		local line = utils.text_get_current_line(0)
		if col > 2 then
			local chars_before_cursor = line:sub(col - 1, col)
			if chars_before_cursor == "::" then
				return true
			end
		end

		-- If line start with if and match statement
		if opts.line:match("^%s*if%s+") or opts.line:match("^%s*match%s+") then
			return false
		end

		return true
	end):with_move(function(opts)
		return opts.char == ">"
	end))

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
