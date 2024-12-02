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

	local function is_in_view_macro()
		local node = vim.treesitter.get_node()
		if not node then
			return false
		end

		while node do
			if node:type() == "macro_invocation" then
				local macro_name = vim.treesitter.get_node_text(node:child(0), 0)
				if macro_name == "view" then
					return true
				end
			end
			node = node:parent()
		end

		return false
	end

	local function should_pair_angle_brackets()
		if is_in_view_macro() then
			return false
		end

		if ts_conds.is_ts_node({ "if_expression", "match_expression" }) then
			return false
		end

		return true
	end

	-- Existing Rust-specific rule
	-- npairs.add_rule(Rule("<", ">", "rust"):with_pair(function()
	-- 	if ts_conds.is_ts_node({ "if_statement" }) then
	-- 		return false
	-- 	end
	--
	-- 	return true
	-- end):with_move(function(opts)
	-- 	return opts.char == ">"
	-- end))
	--
	npairs.add_rule(Rule("<", ">", "rust"):with_pair(function()
		if
			ts_conds.is_ts_node({
				"type_identifier",
				"let_declartion",
				"parameters",
				"generic_type",
				"type_arguments",
				"type_parameters",
				"type_arguments",
			})
		then
			return true
		end

		if is_in_view_macro() then
			return true
		end
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
