return function()
	local wilder = require("wilder")
	wilder.setup({
		modes = { ":", "/", "?" },
	})

	wilder.set_option("pipeline", {
		wilder.branch(
			wilder.cmdline_pipeline({
				language = "python",
				fuzzy = 1,
			}),
			wilder.python_search_pipeline({
				pattern = wilder.python_fuzzy_pattern(),
				sorter = wilder.python_difflib_sorter(),
				engine = "re",
			})
		),
	})

	wilder.set_option(
		"renderer",
		wilder.renderer_mux({

			[":"] = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				border = "rounded",
				-- highlighter = wilder.basic_highlighter(),
				-- highlighter = wilder.lua_fzy_highlighter(),

				highlighter = {
					wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
					wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found
					-- at https://github.com/romgrk/fzy-lua-native
				},
				highlights = {
					accent = wilder.make_hl(
						"WilderAccent",
						"Pmenu",
						{ { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }
					),
				},

				left = { " ", wilder.popupmenu_devicons() },
				right = { " ", wilder.popupmenu_scrollbar() },
				max_height = "28%",
			})),

			["/"] = wilder.wildmenu_renderer({
				-- highlighter = wilder.basic_highlighter(),
				highlighter = wilder.lua_fzy_highlighter(),
				-- apply_incsearch_fix = true,
				separator = " | ",
				left = { " ", wilder.wildmenu_spinner(), " " },
				right = { " ", wilder.wildmenu_index() },
			}),
		})
	)
end
