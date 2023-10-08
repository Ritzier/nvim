return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    config = function(_, otps)
      require("refactoring").setup(opts)
      require("telescope").load_extension "refactoring"
      require("keymaps/refactoring")
    end,
  }
}
