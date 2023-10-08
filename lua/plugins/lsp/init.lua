return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "folke/neoconf.nvim",  cmd = "Neoconf", config = true },
      {
        "j-hui/fidget.nvim",
        -- opt = {
        --   window = { blend = 0 },
        --   fmt = {
        --     max_message = 3
        --   },
        -- },
        config = true,
        tag = 'legacy'
      },
      { "smjonas/inc-rename.nvim", config = true },
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = "Mason",
      },
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "folke/neodev.nvim",
      {
        "simrat39/rust-tools.nvim",
        ft = "rust",
      },

      {
        "nvimdev/lspsaga.nvim",
        config = require("plugins.lsp.lspsaga")
      }
    },
    config = require("plugins.lsp.lsp")
  },
}
