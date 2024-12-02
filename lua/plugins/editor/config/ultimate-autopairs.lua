return function()
	require("ultimate-autopair").setup({
		{
			"<",
			">",
			fly = true,
			dosuround = true,
			multiline = false,
			space = true,
			ft = { "rust" },
			cond = function(opts)
				print(opts)
				return true
			end,
		},
		-- { ">", "<", fly = true, dosuround = true, multiline = true, space = true, surround = true },
		config_internal_pairs = {
			-- {
			-- 	"< ",
			-- 	">",
			-- 	cond = function(fn)
			-- 		return true
			-- 	end,
			-- },
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
			-- {
			-- 	"<",
			-- 	">",
			-- 	multiline = true,
			-- 	surround = true,
			-- 	cond = function(fn)
			-- 		return false
			-- 	end,
			-- },
		},
	})
end
