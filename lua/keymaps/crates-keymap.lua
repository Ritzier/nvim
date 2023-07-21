local wk = require("which-key")
local crates = require("crates")
wk.register({
	["c"] = {
		name = "crates",
		c = { crates.toggle, "Crates Toggle" },
		r = { crates.reload, "Crates Reload" },
	},
})
