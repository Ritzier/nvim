local function edge()
	vim.g.edge_style = "aura"
	vim.g.edge_enable_italic = 1
	vim.g.edge_disable_italic_comment = 1
	vim.g.edge_show_eob = 1
	vim.g.edge_better_performance = 1
	vim.g.edge_transparent_background = 1
end

local function nord()
	vim.g.nord_contrast = true
	vim.g.nord_borders = false
	vim.g.nord_cursorline_transparent = true
	vim.g.nord_disable_background = false
	vim.g.nord_enable_sidebar_background = true
	vim.g.nord_italic = true
end

local function catppuccin()
	local function get_modified_palette()
		local cp = require("catppuccin.palettes").get_palette() -- Get the palette.
		cp.none = "NONE" -- Special setting for complete transparent fg/bg.

		if vim.g.catppuccin_flavour == "mocha" then -- We only modify the "mocha" palette.
			cp.rosewater = "#F5E0DC"
			cp.flamingo = "#F2CDCD"
			cp.mauve = "#DDB6F2"
			cp.pink = "#F5C2E7"
			cp.red = "#F28FAD"
			cp.maroon = "#E8A2AF"
			cp.peach = "#F8BD96"
			cp.yellow = "#FAE3B0"
			cp.green = "#ABE9B3"
			cp.blue = "#96CDFB"
			cp.sky = "#89DCEB"
			cp.teal = "#B5E8E0"
			cp.lavender = "#C9CBFF"

			cp.text = "#D9E0EE"
			cp.subtext1 = "#BAC2DE"
			cp.subtext0 = "#A6ADC8"
			cp.overlay2 = "#C3BAC6"
			cp.overlay1 = "#988BA2"
			cp.overlay0 = "#6E6C7E"
			cp.surface2 = "#6E6C7E"
			cp.surface1 = "#575268"
			cp.surface0 = "#302D41"

			cp.base = "#1E1E2E"
			cp.mantle = "#1A1826"
			cp.crust = "#161320"
		end

		return cp
	end

	local function set_auto_compile(enable_compile)
		-- Setting auto-compile for catppuccin.
		if enable_compile then
			vim.api.nvim_create_augroup("_catppuccin", { clear = true })

			vim.api.nvim_create_autocmd("User", {
				group = "_catppuccin",
				pattern = "PackerCompileDone",
				callback = function()
					require("catppuccin").compile()
					vim.defer_fn(function()
						vim.cmd([[colorscheme catppuccin]])
					end, 0)
				end,
			})
		end
	end

	vim.g.catppuccin_flavour = "mocha" -- Set flavour here
	local cp = get_modified_palette()

	local enable_compile = true -- Set to false if you would like to disable catppuccin cache. (Not recommended)
	set_auto_compile(enable_compile)

	require("catppuccin").setup({
		dim_inactive = {
			enabled = false,
			-- Dim inactive splits/windows/buffers.
			-- NOT recommended if you use old palette (a.k.a., mocha).
			shade = "dark",
			percentage = 0.15,
		},
		transparent_background = false,
		term_colors = true,
		compile = {
			enabled = enable_compile,
			path = vim.fn.stdpath("cache") .. "/catppuccin",
		},
		styles = {
			comments = { "italic" },
			properties = { "italic" },
			functions = { "italic", "bold" },
			keywords = { "italic" },
			operators = { "bold" },
			conditionals = { "bold" },
			loops = { "bold" },
			booleans = { "bold", "italic" },
			numbers = {},
			types = {},
			strings = {},
			variables = {},
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
			lsp_trouble = true,
			lsp_saga = true,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = true,
			which_key = true,
			indent_blankline = { enabled = true, colored_indent_levels = false },
			dashboard = true,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			markdown = true,
			lightspeed = false,
			ts_rainbow = true,
			hop = true,
			illuminate = true,
			cmp = true,
			dap = { enabled = true, enable_ui = true },
			notify = true,
			symbols_outline = false,
			coc_nvim = false,
			leap = false,
			neotree = { enabled = false, show_root = true, transparent_panel = false },
			telekasten = false,
			mini = false,
			aerial = false,
			vimwiki = true,
			beacon = false,
			navic = { enabled = true, custom_bg = "NONE" },
			overseer = false,
			fidget = true,
		},
		color_overrides = {
			mocha = {
				rosewater = "#F5E0DC",
				flamingo = "#F2CDCD",
				mauve = "#DDB6F2",
				pink = "#F5C2E7",
				red = "#F28FAD",
				maroon = "#E8A2AF",
				peach = "#F8BD96",
				yellow = "#FAE3B0",
				green = "#ABE9B3",
				blue = "#96CDFB",
				sky = "#89DCEB",
				teal = "#B5E8E0",
				lavender = "#C9CBFF",

				text = "#D9E0EE",
				subtext1 = "#BAC2DE",
				subtext0 = "#A6ADC8",
				overlay2 = "#C3BAC6",
				overlay1 = "#988BA2",
				overlay0 = "#6E6C7E",
				surface2 = "#6E6C7E",
				surface1 = "#575268",
				surface0 = "#302D41",

				base = "#1E1E2E",
				mantle = "#1A1826",
				crust = "#161320",
			},
		},
		highlight_overrides = {
			mocha = {
				-- For base configs.
				CursorLineNr = { fg = cp.green },
				Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
				IncSearch = { bg = cp.pink, fg = cp.surface1 },

				-- For native lsp configs.
				DiagnosticVirtualTextError = { bg = cp.none },
				DiagnosticVirtualTextWarn = { bg = cp.none },
				DiagnosticVirtualTextInfo = { bg = cp.none },
				DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

				DiagnosticHint = { fg = cp.rosewater },
				LspDiagnosticsDefaultHint = { fg = cp.rosewater },
				LspDiagnosticsHint = { fg = cp.rosewater },
				LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
				LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

				-- For fidget.
				FidgetTask = { bg = cp.none, fg = cp.surface2 },
				FidgetTitle = { fg = cp.blue, style = { "bold" } },

				-- For treesitter.
				TSField = { fg = cp.rosewater },
				TSProperty = { fg = cp.yellow },

				TSInclude = { fg = cp.teal },
				TSOperator = { fg = cp.sky },
				TSKeywordOperator = { fg = cp.sky },
				TSPunctSpecial = { fg = cp.maroon },

				-- TSFloat = { fg = cp.peach },
				-- TSNumber = { fg = cp.peach },
				-- TSBoolean = { fg = cp.peach },

				TSConstructor = { fg = cp.lavender },
				-- TSConstant = { fg = cp.peach },
				-- TSConditional = { fg = cp.mauve },
				-- TSRepeat = { fg = cp.mauve },
				TSException = { fg = cp.peach },

				TSConstBuiltin = { fg = cp.lavender },
				-- TSFuncBuiltin = { fg = cp.peach, style = { "italic" } },
				-- TSTypeBuiltin = { fg = cp.yellow, style = { "italic" } },
				TSVariableBuiltin = { fg = cp.red, style = { "italic" } },

				-- TSFunction = { fg = cp.blue },
				TSFuncMacro = { fg = cp.red, style = {} },
				TSParameter = { fg = cp.rosewater },
				TSKeywordFunction = { fg = cp.maroon },
				TSKeyword = { fg = cp.red },
				TSKeywordReturn = { fg = cp.pink, style = {} },

				-- TSNote = { fg = cp.base, bg = cp.blue },
				-- TSWarning = { fg = cp.base, bg = cp.yellow },
				-- TSDanger = { fg = cp.base, bg = cp.red },
				-- TSConstMacro = { fg = cp.mauve },

				-- TSLabel = { fg = cp.blue },
				TSMethod = { style = { "italic" } },
				TSNamespace = { fg = cp.rosewater },

				TSPunctDelimiter = { fg = cp.teal },
				TSPunctBracket = { fg = cp.overlay2 },
				-- TSString = { fg = cp.green },
				-- TSStringRegex = { fg = cp.peach },
				-- TSType = { fg = cp.yellow },
				TSVariable = { fg = cp.text },
				TSTagAttribute = { fg = cp.mauve, style = { "italic" } },
				TSTag = { fg = cp.peach },
				TSTagDelimiter = { fg = cp.maroon },
				TSText = { fg = cp.text },

				-- TSURI = { fg = cp.rosewater, style = { "italic", "underline" } },
				-- TSLiteral = { fg = cp.teal, style = { "italic" } },
				-- TSTextReference = { fg = cp.lavender, style = { "bold" } },
				-- TSTitle = { fg = cp.blue, style = { "bold" } },
				-- TSEmphasis = { fg = cp.maroon, style = { "italic" } },
				-- TSStrong = { fg = cp.maroon, style = { "bold" } },
				-- TSStringEscape = { fg = cp.pink },

				bashTSFuncBuiltin = { fg = cp.red, style = { "italic" } },
				bashTSParameter = { fg = cp.yellow, style = { "italic" } },

				luaTSField = { fg = cp.lavender },
				luaTSConstructor = { fg = cp.flamingo },

				javaTSConstant = { fg = cp.teal },

				typescriptTSProperty = { fg = cp.lavender, style = { "italic" } },

				cssTSType = { fg = cp.lavender },
				cssTSProperty = { fg = cp.yellow, style = { "italic" } },

				cppTSProperty = { fg = cp.text },
			},
		},
	})
end

edge()
nord()
catppuccin()

vim.cmd("colorscheme catppuccin")
