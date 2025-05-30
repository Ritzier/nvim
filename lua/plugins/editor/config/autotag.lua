return function()
	require("nvim-ts-autotag").setup({
		opts = {
			-- Defaults
			enable_close = true, -- when true, it will overwrite the autopair <> configuration
			enable_rename = true, -- Auto rename pairs of tags
			enable_close_on_slash = true, -- Auto close on trailing </
		},
		-- per_filetype = {
		-- 	["rust"] = {
		-- 		enable_close = true,
		-- 		-- enable_close_on_slash = true, -- Auto close on trailing </
		-- 	},
		-- },
	})
end
