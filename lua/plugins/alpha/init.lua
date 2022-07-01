local present, module = pcall(require, "alpha")

if present then
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
        [[█▄▄▄▄ ▄█    ▄▄▄▄▀ ▄▄▄▄▄▄   ▄█ ▄███▄   █▄▄▄▄ ]],
        [[█  ▄▀ ██ ▀▀▀ █   ▀   ▄▄▀   ██ █▀   ▀  █  ▄▀ ]],
        [[█▀▀▌  ██     █    ▄▀▀   ▄▀ ██ ██▄▄    █▀▀▌  ]],
        [[█  █  ▐█    █     ▀▀▀▀▀▀   ▐█ █▄   ▄▀ █  █  ]],
        [[  █    ▐   ▀                ▐ ▀███▀     █   ]],
        [[ ▀                                     ▀    ]],
    }
end
