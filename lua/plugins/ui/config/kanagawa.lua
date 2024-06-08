return function()
	require("kanagawa").setup({
		compile = true,
		undercurl = true,
		commentStyle = { italic = true },
		functionStyle = { bold = true },
		keywordStyle = { bold = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = false, -- do not set background color
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = { -- add/modify theme and palette colors
			palette = {},
			theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		},
		overrides = function(cp)
			return {
				-- For base configs
				-- NormalFloat = { fg = cp.text, bg = cp.sumiInk2 },
				-- FloatBorder = {
				-- 	fg = cp.sumiInk2,
				-- 	bg = cp.sumiInk2,
				-- },
				-- CursorLineNr = { fg = cp.springGreen },

				-- -- For native lsp configs
				-- DiagnosticVirtualTextError = { bg = cp.none },
				-- DiagnosticVirtualTextWarn = { bg = cp.none },
				-- DiagnosticVirtualTextInfo = { bg = cp.none },
				-- MasonNormal = { link = "NormalFloat" },
				--
				-- -- For indent-blankline
				-- IblScope = { fg = cp.sakuraPink, style = { "bold" } },
				--
				-- -- For nvim-cmp and wilder.nvim
				-- Pmenu = { fg = cp.oniViolet2, bg = cp.base },
				-- PmenuBorder = { fg = cp.springViolet2, bg = cp.base },
				-- PmenuSel = { bg = cp.springGreen, fg = cp.base },
				-- CmpItemAbbr = { fg = cp.oniViolet2 },
				-- CmpItemAbbrMatch = { fg = cp.crystalBlue, style = { "bold" } },
				-- CmpDoc = { link = "NormalFloat" },
				-- CmpDocBorder = {
				-- 	fg = cp.sumiInk2,
				-- 	bg = cp.sumiInk2,
				-- },

				-- -- For fidget
				-- FidgetTask = { bg = cp.none, fg = cp.sumiInk1 },
				-- FidgetTitle = { fg = cp.crystalBlue, style = { "bold" } },
				--
				-- -- For nvim-notify
				-- NotifyBackground = { bg = cp.base },
				--
				-- -- For nvim-tree
				-- NvimTreeRootFolder = { fg = cp.sakuraPink },
				-- NvimTreeIndentMarker = { fg = cp.sumiInk1 },
				--
				-- -- For trouble.nvim
				-- TroubleNormal = { bg = cp.base },
				--
				-- -- For telescope.nvim
				-- TelescopeMatching = { fg = cp.oniViolet },
				-- TelescopeResultsDiffAdd = { fg = cp.springGreen },
				-- TelescopeResultsDiffChange = { fg = cp.roninYellow },
				-- TelescopeResultsDiffDelete = { fg = cp.samuraiRed },
				--
				-- -- For glance.nvim
				-- -- GlanceWinBarFilename = { fg = cp.subtext1, style = { "bold" } },
				-- -- GlanceWinBarFilepath = { fg = cp.subtext0, style = { "italic" } },
				-- -- GlanceWinBarTitle = { fg = cp.teal, style = { "bold" } },
				-- -- GlanceListCount = { fg = cp.oniViolet },
				-- -- GlanceListFilepath = { link = "Comment" },
				-- -- GlanceListFilename = { fg = cp.crystalBlue },
				-- -- GlanceListMatch = { fg = cp.oniViolet, style = { "bold" } },
				-- -- GlanceFoldIcon = { fg = cp.springGreen },
				--
				-- -- For nvim-treehopper
				-- TSNodeKey = {
				-- 	fg = cp.surimiOrange,
				-- 	bg = cp.none or cp.base,
				-- 	style = { "bold", "underline" },
				-- },
				--
				-- -- Dressing
				-- DressingTitle = { bg = cp.oniViolet, fg = cp.oniViolet },
				-- DressingBorder = { fg = cp.springGreen },
				--
				-- -- For treesitter
				-- ["@keyword.return"] = { fg = cp.sakuraPink, style = clear },
				-- ["@error.c"] = { fg = cp.none, style = clear },
				-- ["@error.cpp"] = { fg = cp.none, style = clear },
			}
		end,
		theme = "wave", -- Load "wave" theme when 'background' option is not set
		background = { -- map the value of 'background' option to a theme
			dark = "wave", -- try "dragon" !
			light = "lotus",
		},
	})
end
