local function load_config()
    local config = require("modules.lsp.config")
    config.lightbulb()
    config.aerial()
    config.cmp()
    config.luasnip()
    config.bqf()
end

load_config()
require("modules.lsp.lsp-config")
