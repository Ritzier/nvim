local M = {}
local script = require("rit.script")

function M.setup()
    if script.check("alpha") then
        M.config()
    end
end

function M.config()
    local dashboard = require("alpha.themes.dashboard")
    local function header()
        return {
            [[  ()_()     wW  Ww  (o)__(o)      _oo      wW  Ww    wWw     ()_()  ]],
            [[  (O o)     (O)(O)  (__  __)   >-(_  \     (O)(O)    (O)_    (O o)  ]],
            [[   |^_\      (..)     (  )        / _/      (..)     / __)    |^_\  ]],
            [[   |(_))      ||       )(        / /         ||     / (       |(_)) ]],
            [[   |  /      _||_     (  )      / (         _||_   (  _)      |  /  ]],
            [[   )|\\     (_/\_)     )/      (   `-.     (_/\_)   \ \_      )|\\  ]],
            [[  (/  \)              (         `--.._)              \__)    (/  \) ]]
        }
    end

    dashboard.section.header.val = header()

    dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    local function footer()
    -- Number of plugins
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date "%d-%m-%Y %H:%M:%S"
    local plugins_text = 
      "   "
      .. total_plugins
      .. " plugins"
      .. "   v"
      .. vim.version().major
      .. "."
      .. vim.version().minor
      .. "."
      .. vim.version().patch
      .. "   "
      .. datetime

    -- Quote
    local fortune = require "alpha.fortune"
    local quote = table.concat(fortune(), "\n")

    return plugins_text .. "\n" .. quote
  end

  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Constant"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Function"
  dashboard.section.buttons.opts.hl_shortcut = "Type"
  dashboard.opts.opts.noautocmd = true

  alpha.setup(dashboard.opts)
end

M.setup()
