return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "kdheepak/cmp-latex-symbols",
      "onsails/lspkind.nvim",
      "lukas-reineke/cmp-under-comparator",
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip").config.set_config({
            history = false,
            update_events = "TextChanged, TextChangedI",
            delete_check_events = "TextChanged, InsertLeave",
          })
          require("luasnip.loaders.from_lua").lazy_load()
          -- require("luasnip.loaders.from_vscode").lazy_load()
          -- require("luasnip.loaders.from_snipmate").lazy_load()
        end
      },
    },
    config = require("plugins.cmp.config")
  }
}
