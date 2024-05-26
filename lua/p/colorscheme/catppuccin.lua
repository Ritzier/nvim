--vim.cmd([[highlight indicator_selected guibg=#909090 guifg=#909090]])

return function()
  require("catppuccin").setup({
    flavour = "mocha",

    background = {
      light = "latte",
      dark = "mocha",
    },

    term_colors = true,

    styles = {
      comment = { "italic" },
      properties = { "italic" },
      functions = { "bold" },
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
      aerial = false,
      alpha = false,
      barbar = false,
      beacon = false,
      cmp = true,
      coc_nvim = false,
      dap = { enabled = true, enable_ui = true },
      dashboard = false,
      dropbar = { enabled = true, color_mode = true },
      fern = false,
      fidget = true,
      flash = false,
      gitgutter = false,
      gitsigns = true,
      harpoon = false,
      headlines = false,
      hop = true,
      illuminate = true,
      indent_blankline = { enabled = true, colored_indent_levels = false },
      leap = false,
      lightspeed = false,
      lsp_saga = true,
      lsp_trouble = true,
      markdown = true,
      mason = true,
      mini = false,
      navic = { enabled = false },
      neogit = false,
      neotest = false,
      neotree = { enabled = false, show_root = true, transparent_panel = false },
      noice = false,
      notify = true,
      nvimtree = true,
      overseer = false,
      pounce = false,
      rainbow_delimiters = true,
      sandwich = false,
      semantic_tokens = true,
      symbols_outline = true,
      telekasten = false,
      telescope = { enabled = true, style = "nvchad" },
      treesitter_context = true,
      ts_rainbow = false,
      vim_sneak = false,
      vimwiki = false,
      which_key = true,
    },

    highlight_overrides = {
      all = function(cp)
        return {

          NormalFloat = { fg = cp.text, bg = cp.mantle },
          FloatBorder = {
            fg = cp.blue or cp.mantle,
            bg = cp.mantle,
          },
          CursorLineNr = { fg = cp.green },

          -- For native lsp configs
          DiagnosticVirtualTextError = { bg = cp.none },
          DiagnosticVirtualTextWarn = { bg = cp.none },
          DiagnosticVirtualTextInfo = { bg = cp.none },
          DiagnosticVirtualTextHint = { bg = cp.none },
          LspInfoBorder = { link = "FloatBorder" },

          -- For mason.nvim
          MasonNormal = { link = "NormalFloat" },

          -- For indent-blankline
          IndentBlanklineChar = { fg = cp.surface0 },
          IndentBlanklineContextChar = { fg = cp.surface2, style = { "bold" } },

          -- For nvim-cmp and wilder.nvim
          Pmenu = { fg = cp.overlay2, bg = cp.base },
          PmenuBorder = { fg = cp.surface1, bg = cp.base },
          PmenuSel = { bg = cp.green, fg = cp.base },
          CmpItemAbbr = { fg = cp.overlay2 },
          CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
          CmpDoc = { link = "NormalFloat" },
          CmpDocBorder = {
            fg = cp.mantle,
            bg = cp.mantle,
          },

          -- For fidget
          FidgetTask = { bg = cp.none, fg = cp.surface2 },
          FidgetTitle = { fg = cp.blue, style = { "bold" } },

          -- For nvim-tree
          NvimTreeRootFolder = { fg = cp.pink },
          NvimTreeIndentMarker = { fg = cp.surface2 },

          -- For trouble.nvim
          TroubleNormal = { bg = cp.base },

          -- For telescope.nvim
          TelescopeMatching = { fg = cp.lavender },
          TelescopeResultsDiffAdd = { fg = cp.green },
          TelescopeResultsDiffChange = { fg = cp.yellow },
          TelescopeResultsDiffDelete = { fg = cp.red },

          -- For glance.nvim
          GlanceWinBarFilename = { fg = cp.subtext1, style = { "bold" } },
          GlanceWinBarFilepath = { fg = cp.subtext0, style = { "italic" } },
          GlanceWinBarTitle = { fg = cp.teal, style = { "bold" } },
          GlanceListCount = { fg = cp.lavender },
          GlanceListFilepath = { link = "Comment" },
          GlanceListFilename = { fg = cp.blue },
          GlanceListMatch = { fg = cp.lavender, style = { "bold" } },
          GlanceFoldIcon = { fg = cp.green },

          -- For nvim-treehopper
          TSNodeKey = {
            fg = cp.peach,
            bg = cp.none or cp.base,
            style = { "bold", "underline" },
          },

          -- For treesitter
          ["@keyword.return"] = { fg = cp.pink, style = clear },
          ["@error.c"] = { fg = cp.none, style = clear },
          ["@error.cpp"] = { fg = cp.none, style = clear },

          BufferLineIndicatorSelected = { fg = "#F38BA8", sp = "#F38BA8" },
          BufferLineTapSelected = { bg = "#F38BA8", fg = "#F38BA8", sp = "#F38BA8" },
          BufferLineTabSeparatorSelected = { bg = "#F38BA8", fg = "#F38BA8", sp = "#F38BA8" },
          TabLine = { bg = "#F38BA8", fg = "#F38BA8", sp = "#F38BA8" },
          TabLineFill = { bg = "#F38BA8", fg = "#F38BA8", sp = "#F38BA8" },
          TabLineSel = { bg = "#F38BA8", fg = "#F38BA8", sp = "#F38BA8" },
        }
      end,
    },
  })
end
