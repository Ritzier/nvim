return function()
	require("ultimate-autopair").setup({
		{ "<", ">", fly = true, dosuround = true, multiline = false, space = true, surround = true },
		config_internal_pairs = {
			{
				"'",
				"'",
				multiline = false,
				surround = true,
				cond = function(fn)
					if fn.get_ft() ~= "rust" then
						return true
					end
					return not fn.in_node({ "bounded_type", "reference_type", "type_arguments", "type_parameters" })
				end,
			},
		},
	})
end
