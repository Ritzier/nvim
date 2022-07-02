local present, module = pcall(require, "nvim-autopairs")

if present then
    local npairs = require "nvim-autopairs"
    npairs.setup {
        check_ts = true,
        fast_wrap = {
            map = '<M-e>',
            chars = { '{', '[', '(', '"', "'" },
            pattern = [=[[%'%"%)%>%]%)%}%,]]=],
            end_key = '$',
            keys = 'qwertyuiopzxcvbnmasdfghjkl',
            check_comma = true,
            highlight = 'Search',
            highlight_grey='Comment'
        }
    }
    npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")
end

