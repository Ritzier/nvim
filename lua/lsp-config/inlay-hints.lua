require("inlay-hints").setup({
  eol = {
    parameter = {
      separator = ", ",
      format = function(hints)
        return string.format(" <- (%s)", hints)
      end
    },
    type = {
      separator = ", ",
      format = function(hints)
        return string.format(" => (%s)", hints)
      end
    }
  }
})
