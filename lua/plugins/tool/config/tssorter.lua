return function()
	require("tssorter").setup({
		sortables = {
			css = {
				declaration = {
					node = "declaration",
					ordinal = "property_name",
				},
				-- Add rule_set for sorting entire blocks
				rule_set = {
					node = "rule_set",
					ordinal = "declaration",
				},
			},
			scss = {
				declaration = {
					node = "declaration",
					ordinal = "property_name",
				},
				rule_set = {
					node = "rule_set",
					ordinal = "declaration",
				},
			},
		},
	})
end
