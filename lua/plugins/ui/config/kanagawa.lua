return function()
	require("kanagawa").setup({
		compile = true,
		undercurl = true,
		commentStyle = { italic = true },
		functionStyle = { bold = true },
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = false, -- do not set background color
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = { -- add/modify theme and palette colors
			palette = {},
			theme = { wave = {}, lotus = {}, dragon = {}, all = {
				ui = {
					bg_gutter = "none",
				},
			} },
		},
		overrides = function(cp)
			local theme = cp.theme
			local palette = cp.palette
			return {
				Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg },
				PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
				PmenuSbar = { bg = theme.ui.bg_m1 },
				PmenuThumb = { bg = theme.ui.bg_p2 },

				CmpItemAbbr = { fg = palette.dragonGray },
				CmpItemAbbrDeprecated = { fg = palette.dragonGray },
				CmpItemAbbrMatch = { fg = palette.crystalBlue, bold = true },
				CmpItemAbbrMatchFuzzy = { fg = palette.dragonGray, bold = true },
				CmpItemKindVariable = { fg = palette.lotusYellow3, bold = true },
				CmpItemKindFunction = { fg = palette.oniViolet, bold = true },
				CmpItemKindEnum = { fg = palette.sakuraPink, bold = true },
				CmpItemKindEnumMember = { fg = palette.carpYellow, bold = true },
				CmpItemKindMethod = { fg = palette.surimiOrange, bold = true },
				CmpItemKindField = { fg = palette.springBlue, bold = true },
				CmpItemKindKeyword = { fg = palette.waveRed, bold = true },
				CmpItemKindConstant = { fg = palette.lotusOrange2, bold = true },
				CmpItemKindInterface = { fg = palette.lotusWhite5, bold = true },
				CmpItemKindReference = { fg = palette.springGreen, bold = true },
				CmpItemKindStruct = { fg = palette.crystalBlue, bold = true },

				-- Dressing INFO: not work
				DressingTitle = { bg = "NONE", fg = palette.springGreen },
				DressingBorder = { bg = palette.springGreen, fg = palette.springGreen },

				-- Ufo
				Folded = { bg = "NONE", fg = "NONE" },
				MoreMsg = { bg = palette.sakuraPink, fg = palette.springBlue },

				-- IndentBlankline
				IblScope = { fg = palette.waveRed },
			}
		end,
		theme = "wave", -- Load "wave" theme when 'background' option is not set
		background = { -- map the value of 'background' option to a theme
			dark = "wave", -- try "dragon" !
			light = "lotus",
		},
	})
end
