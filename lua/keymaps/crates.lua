local wk = require("which-key")

return function()
	if vim.fn.expand("%:t") == "Cargo.toml" then
		wk.register({
			["C"] = {
				name = "Crate",
                s = {
                    name = "Show",
                    d = { "<cmd>Crates show_dependencies_popup<CR>", "Show Dependencies" }
                }
			},
		})
	end
end
