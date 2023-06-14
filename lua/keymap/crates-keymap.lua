local wk = require("which-key")

wk.register({
	["<space>c"] = {
		name = "Crates",
		t = {
			function()
				require("crates").toggle()
			end,
			"Crates Toggle",
		},
		r = {
			function()
				require("crates").reload()
			end,
			"Creates: Reload",
		},
		s = {
			function()
				require("crates").show_popup()
			end,
			"Pop-up window",
		},
		f = {
			function()
				require("crates").show_version_popup()
				require("crates").show_popup()
			end,
			"Select spec versions",
		},
		d = {
			function()
				require("crates").show_dependencies_popup()
				require("crates").show_popup()
			end,
            "Show project dependencies"
		},
        u = {
            function()
			require("crates").update_crate()
            end,
            "Update current crate's spec"
        },
        a = {
            function()
			require("crates").update_all_crates()
            end,
            "Update all crates's spec"
        },
        U = {
            function()
                require("crates").upgrade_crates()
            end,
            "Upgrade current crate"
        },
        A = {
            function()
                require("crates").upgrade_all_crates()
            end,
            "Upgrade all crates"
        },
        H = {
            function()
			require("crates").open_homepage()
            end,
            "Open current crate's homepage"
        },
        R = {
            function()
			require("crates").open_repository()
            end,
            "Open current crate's repository"
        },
        D = {
            function()
                require("crates").open_documentation()
            end,
            "Open current crate's documentation'"
        },
        C = {
            function()
			require("crates").open_crates_io()
            end,
            "Browse current crate on crates.io"
        }
	},
}, { mode = "n", prefix = "", silent = true })

wk.register({
    ["<space>c"] = {
        name = "Crates",
        u = {
            function()
                require("crates").update_crates()
            end,
            "Update selected crate's spec"
        },
        U = {
            function()
                require("crates").upgrade_crates()
            end,
            "Upgrade selected crates"
        },
    }
})
