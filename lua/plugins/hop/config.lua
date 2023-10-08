return function()
  local hop = require("hop")
  local directions = require("hop.hint").HintDirection

  require("keymaps.hop")(hop, directions)
end
