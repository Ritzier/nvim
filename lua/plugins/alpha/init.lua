local M = {}
local Script = require("core.script")

function M.setup()
    if Script.check("alpha") then
        M.configa()
    end
end

function M.config()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
        [[  ()_()     wW  Ww  (o)__(o)      _oo      wW  Ww    wWw     ()_()  ]],
        [[  (O o)     (O)(O)  (__  __)   >-(_  \     (O)(O)    (O)_    (O o)  ]],
        [[   |^_\      (..)     (  )        / _/      (..)     / __)    |^_\  ]],
        [[   |(_))      ||       )(        / /         ||     / (       |(_)) ]],
        [[   |  /      _||_     (  )      / (         _||_   (  _)      |  /  ]],
        [[   )|\\     (_/\_)     )/      (   `-.     (_/\_)   \ \_      )|\\  ]],
        [[  (/  \)              (         `--.._)              \__)    (/  \) ]]
    }

    local function button(sc, txt, leader_txt, keybind, keybind_opts)
        local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

        local opts = {
            position = "center",
            shortcut = sc,
            cursor = 5,
            width = 50,
            align_shortcut = "right",
            hl_shortcut = "Keyword",
        }

        if nil == keybind then
            keybind = sc_after
        end
        keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_after, keybind, keybind_opts }

        local function on_press()
            -- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
            local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
            vim.api.nvim_feedkeys(key, "t", false)
        end

        return {
            type = "button",
            val = txt,
            on_press = on_press,
            opts = opts,
        }
    end

    local leader = "comma"
    dashboard.section.buttons.val = {
        button("comma s c", " Scheme change", leader, "<cmd>Telescope colorscheme<cr>"),
        button("comma f r", " File frecency", leader, "<cmd>Telescope frecency<cr>"),
        button("comma f e", " File history", leader, "<cmd>Telescope oldfiles<cr>"),
        button("comma f p", " Project find", leader, "<cmd>Telescope project<cr>"),
        button("comma f f", " File find", leader, "<cmd>Telescope find_files<cr>"),
        button("comma f n", " File new", leader, "<cmd>enew<cr>"),
        button("comma f w", " Word find", leader, "<cmd>Telescope live_grep<cr>"),
    }
    dashboard.section.buttons.opts.hl = "String"

    local function footer()
        local total_plugins = #vim.tbl_keys(packer_plugins)
        return "   Have Fun with neovim"
            .. "   v"
            .. vim.version().major
            .. "."
            .. vim.version().minor
            .. "."
            .. vim.version().patch
            .. "   "
            .. total_plugins
            .. " plugins"
    end

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "Function"

    local head_butt_padding = 2
    local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
    local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
    local foot_butt_padding = 1

    dashboard.config.layout = {
        { type = "padding", val = header_padding },
        dashboard.section.header,
        { type = "padding", val = head_butt_padding },
        dashboard.section.buttons,
        { type = "padding", val = foot_butt_padding },
        dashboard.section.footer,
    }

    alpha.setup(dashboard.opts)
end

function M.configa()
    local dashboard = require "alpha.themes.dashboard"
  local function header()
    return {
      [[                                           bbbbbbbb            ]],
      [[                                           b::::::b            ]],
      [[                                           b::::::b            ]],
      [[                                           b::::::b            ]],
      [[                                            b:::::b            ]],
      [[nnnn  nnnnnnnn    vvvvvvv           vvvvvvv b:::::bbbbbbbbb    ]],
      [[n:::nn::::::::nn   v:::::v         v:::::v  b::::::::::::::bb  ]],
      [[n::::::::::::::nn   v:::::v       v:::::v   b::::::::::::::::b ]],
      [[nn:::::::::::::::n   v:::::v     v:::::v    b:::::bbbbb:::::::b]],
      [[  n:::::nnnn:::::n    v:::::v   v:::::v     b:::::b    b::::::b]],
      [[  n::::n    n::::n     v:::::v v:::::v      b:::::b     b:::::b]],
      [[  n::::n    n::::n      v:::::v:::::v       b:::::b     b:::::b]],
      [[  n::::n    n::::n       v:::::::::v        b:::::b     b:::::b]],
      [[  n::::n    n::::n        v:::::::v         b:::::bbbbbb::::::b]],
      [[  n::::n    n::::n         v:::::v          b::::::::::::::::b ]],
      [[  n::::n    n::::n          v:::v           b:::::::::::::::b  ]],
      [[  nnnnnn    nnnnnn           vvv            bbbbbbbbbbbbbbbb   ]],
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

  require("alpha").setup(dashboard.opts)

end

M.setup()
