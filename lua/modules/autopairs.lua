require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt" },
    check_ts = true,
})

require('nvim-autopairs').add_rules(require "nvim-autopairs.rules.endwise-lua")
