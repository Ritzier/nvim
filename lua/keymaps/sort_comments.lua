local function sort_cargo_groups()
	local start_line = math.min(vim.fn.line("'<"), vim.fn.line("'>"))
	local end_line = math.max(vim.fn.line("'<"), vim.fn.line("'>"))

	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

	-- Split lines into groups. Each comment line starts a new group.
	-- Non-blank lines go into the current group; anything before the first
	-- comment forms its own (headerless) group so it isn't lost.
	local groups = {}
	local current = nil

	for _, line in ipairs(lines) do
		if line:match("^%s*#") then
			current = { line }
			table.insert(groups, current)
		elseif line:match("%S") then
			if current then
				table.insert(current, line)
			else
				current = { line }
				table.insert(groups, current)
			end
		end
	end

	-- Stable sort by the comment text (case-insensitive).
	local order = {}
	for i, g in ipairs(groups) do
		order[g] = i
	end

	table.sort(groups, function(a, b)
		local ka = a[1]:match("^%s*#%s*(.*)") or ""
		local kb = b[1]:match("^%s*#%s*(.*)") or ""
		local la, lb = ka:lower(), kb:lower()
		if la == lb then
			return order[a] < order[b]
		end
		return la < lb
	end)

	-- Rebuild, separating groups with a single blank line.
	local result = {}
	for i, group in ipairs(groups) do
		if i > 1 then
			table.insert(result, "")
		end
		vim.list_extend(result, group)
	end

	print(start_line, end_line)

	vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, result)
end

vim.keymap.set("v", "<leader>s", sort_cargo_groups, {
	desc = "Sort Cargo groups",
})
