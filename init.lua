local script = require("core.script")
require("core")
require("modules")
script.req("modules.which_key", "which-key")

script.req("modules.notify", "notify")
script.req("modules.colorscheme", "gruvbox", "rose-pine", "tokyonight", "nightfox")
script.req("modules.bufferline", "bufferline")
script.req("modules.nvim_tree", "nvim-tree")
script.req("modules.treesitter", "nvim-treesitter")
script.req("modules.indentline", "indent_blankline")
script.req("modules.autopairs", "nvim-autopairs")
script.req("modules.comment", "Comment")
script.req("modules.toggleterm", "toggleterm")
script.req("modules.gitsigns", "gitsigns")
script.req("modules.alpha", "alpha")
script.req("modules.symbols_outline", "packer")
script.req("modules.lualine", "lualine", "nvim-navic")
script.req("modules.symbols_outline", "symbols-outline")
script.req("modules.wilder", "wilder")

script.req("keymaps", "packer")

script.req("modules.scroll", "neoscroll", "fzy-lua-native")
script.req("modules.telescope_config", "telescope")
script.req("modules.trouble", "trouble")
script.req("modules.colorizer", "colorizer")
script.req("modules.diffview", "diffview")

script.req("modules.lsp", "lspconfig")

script.req("modules.icons_picker", "icon-picker")

-- script.req("modules.dap", "dap")

script.req("modules.move_config", "packer")
