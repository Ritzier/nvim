return {
  {
    "akinsho/nvim-bufferline.lua",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = require("plugins.buffer.config")
  },

  -- scope buffers to tabs
  { "tiagovla/scope.nvim", event = "VeryLazy", opts = {} },
}
