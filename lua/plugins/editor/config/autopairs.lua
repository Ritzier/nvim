return function()
	local npairs = require("nvim-autopairs")
	local Rule = require("nvim-autopairs.rule")
	local ts_conds = require("nvim-autopairs.ts-conds")

	npairs.setup({
		check_ts = true,
	})

	npairs.add_rule(Rule("<", ">"):with_pair(function(opts)
		local bufnr = opts.bufnr

		-- Function to check if is inside a view! macro
		local function is_in_view_macro()
			local current_linenr = vim.api.nvim_win_get_cursor(0)[1]

			-- Search backwards for view! macro start
			for i = current_linenr, 1, -1 do
				local line_content = vim.api.nvim_buf_get_lines(bufnr, i - 1, i, false)[1]

				-- Check if line contains view! macro start
				if line_content:match("view!%s*{") then
					return true
				end

				-- Stop searching if we find a closing brace that's not part of the macro
				if line_content:match("%s*}") then
					break
				end
			end

			return false
		end

		-- Start checking view! macro
		if is_in_view_macro() then
			return false
		end

		-- Check is it start with if and match
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
