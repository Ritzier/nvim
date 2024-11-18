return function()
	local npairs = require("nvim-autopairs")
	local Rule = require("nvim-autopairs.rule")
	local ts_conds = require("nvim-autopairs.ts-conds")

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
end
