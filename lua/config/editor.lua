local M = {}

function M.nvim_treesitter()
  require("nvim-treesitter.configs").setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "all",

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,
    },

    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },

    indent = { enable = true },

    -- vim-matchup
    matchup = {
      enable = true,
    },

    -- nvim-treesitter-textsubjects
    textsubjects = {
      enable = true,
      prev_selection = ",", -- (Optional) keymap to select the previous selection
      keymaps = {
        ["."] = "textsubjects-smart",
        [";"] = "textsubjects-container-outer",
        ["i;"] = "textsubjects-container-inner",
      },
    },

    -- nvim-treesitter-textobjects
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },

      swap = {
        enable = true,
        swap_next = {
          ["<leader>cx"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>cX"] = "@parameter.inner",
        },
      },

      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },

      -- lsp_interop = {
      --   enable = true,
      --   border = "none",
      --   peek_definition_code = {
      --     ["<leader>cf"] = "@function.outer",
      --     ["<leader>cF"] = "@class.outer",
      --   },
      -- },
    },

    -- endwise
    endwise = {
      enable = true,
    },

    -- autotag
    autotag = {
      enable = true,
    },

    -- context_commentstring
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },

    -- indent
    -- yati = { enable = true },
  }
end

function M.matchup()
    vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
end

function M.autotag()
	require("nvim-ts-autotag").setup({
		filetypes = {
			"html",
			"xml",
			"javascript",
			"typescriptreact",
			"javascriptreact",
			"vue",
		},
	})
end

function M.toggleterm()
	require("toggleterm").setup({
		-- size can be a number or function which is passed the current terminal
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.40
			end
		end,
		open_mapping = [[<c-\>]],
		hide_numbers = true, -- hide the number column in toggleterm buffers
		shade_filetypes = {},
		shade_terminals = false,
		shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
		start_in_insert = true,
		insert_mappings = true, -- whether or not the open mapping applies in insert mode
		persist_size = true,
		direction = "horizontal",
		close_on_exit = true, -- close the terminal window when the process exits
		shell = vim.o.shell, -- change the default shell
	})
end

function M.nvim_colorizer()
    require("colorizer").setup()
end

function M.symbol_outline()
    vim.g.symbols_outline = {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = true,
        position = 'right',
        relative_width = true,
        width = 25,
        auto_close = false,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = 'Pmenu',
        keymaps = { -- These keymaps can be a string or a table for multiple keys
            close = {"<Esc>", "q"},
            goto_location = "<Cr>",
            focus_location = "o",
            hover_symbol = "<C-space>",
            toggle_preview = "K",
            rename_symbol = "r",
            code_actions = "a",
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
            File = {icon = "", hl = "TSURI"},
            Module = {icon = "", hl = "TSNamespace"},
            Namespace = {icon = "", hl = "TSNamespace"},
            Package = {icon = "", hl = "TSNamespace"},
            Class = {icon = "𝓒", hl = "TSType"},
            Method = {icon = "ƒ", hl = "TSMethod"},
            Property = {icon = "", hl = "TSMethod"},
            Field = {icon = "", hl = "TSField"},
            Constructor = {icon = "", hl = "TSConstructor"},
            Enum = {icon = "ℰ", hl = "TSType"},
            Interface = {icon = "ﰮ", hl = "TSType"},
            Function = {icon = "", hl = "TSFunction"},
            Variable = {icon = "", hl = "TSConstant"},
            Constant = {icon = "", hl = "TSConstant"},
            String = {icon = "𝓐", hl = "TSString"},
            Number = {icon = "#", hl = "TSNumber"},
            Boolean = {icon = "⊨", hl = "TSBoolean"},
            Array = {icon = "", hl = "TSConstant"},
            Object = {icon = "⦿", hl = "TSType"},
            Key = {icon = "🔐", hl = "TSType"},
            Null = {icon = "NULL", hl = "TSType"},
            EnumMember = {icon = "", hl = "TSField"},
            Struct = {icon = "𝓢", hl = "TSType"},
            Event = {icon = "🗲", hl = "TSType"},
            Operator = {icon = "+", hl = "TSOperator"},
            TypeParameter = {icon = "𝙏", hl = "TSParameter"}
        }
    }
end

return M
