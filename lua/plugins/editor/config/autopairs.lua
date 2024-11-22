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

	local function is_turbofish_context(col, line)
		if col <= 2 then
			return false
		end

		return line:sub(col - 1, col) == "::"
	end

	local function is_type_context(line)
		local type_patterns = {
			-- Function declarations and implementations
			"^%s*fn%s+[%w_]+%s*%([^%)]*%)",
			"^%s*impl%s+",

			-- Type annotations and constraints
			":%s*[%w_]+%s*$",
			"<%s*[%w_]+%s*=%s*$",

			-- Variable declarations
			"let%s+[%w_]+:%s*$",
			"where%s+[%w_]+:%s*$",

			-- Common Rust types
			"%f[%w]Vec%s*$",
			"%f[%w]Option%s*$",
			"%f[%w]Result%s*$",
			"%f[%w]Box%s*$",
			"%f[%w]Rc%s*$",
			"%f[%w]Arc%s*$",

			-- Trait bounds and dynamic dispatch
			"dyn%s+",
		}

		for _, pattern in ipairs(type_patterns) do
			if line:match(pattern) then
				return true
			end
		end
	end

	-- Existing Rust-specific rule
	npairs.add_rule(Rule("<", ">", "rust"):with_pair(function(opts)
		local _row, col = utils.get_cursor(0)
		local line = utils.text_get_current_line(0)

		if is_turbofish_context(col, line) then
			return true
		end

		if is_type_context(line) then
			return true
		end

		return false

		-- Autopairs TS is not working
		-- return ts_conds.is_ts_node({
		-- 	"type_identifier",
		-- 	"type_parameters",
		-- 	"type_arguments",
		-- 	"generic_type",
		-- 	"qualified_type",
		-- 	"reference_type",
		-- 	"trait_bounds",
		-- 	"impl_item",
		-- 	"type_bound",
		-- 	"where_clause",
		-- 	"type_annotation",
		-- })(opts)
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
