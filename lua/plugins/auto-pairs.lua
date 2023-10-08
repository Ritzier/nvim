return {
  {
    "jiangmiao/auto-pairs",
    lazy = false,
    event = "InsertEnter",
    config = function()
      vim.cmd([[
      let g:AutoPairsShortcutFastWrap = '<M-e>'
      let g:AutoPairsFlyMode = 1
      ]])
    end
  }
}
