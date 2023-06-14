return function()

    local icons = {
        ui = require("modules.utils.icons").get("ui", true),
        kind = require("modules.utils.icons").get("kind", true),
        type = require("modules.utils.icons").get("type", true),
    }

    require("lspsaga").setup({
        preview = {
            lines_above = 1,
            lines_below = 12,
        },
        scroll_preview = {
            scroll_down = "<C-j>",
            scroll_up = "<C-k>",
        },
        request_timeout = 3000,
        finder = {
            edit = { "o", "<CR>" },
            vsplit = "s",
            split = "i",
            tabe = "t",
            quit = { "q", "<ESC>" },
        },
        definition = {
            edit = "<C-c>o",
            vsplit = "<C-c>v",
            split = "<C-c>s",
            tabe = "<C-c>t",
            quit = "q",
            close = "<Esc>",
        },
        code_action = {
            num_shortcut = true,
            keys = {
                quit = "q",
                exec = "<CR>",
            },
        },
        lightbulb = {
            enable = false,
        },
        diagnostic = {
            twice_into = false,
            show_code_action = false,
            show_source = false,
            keys = {
                exec_action = "<CR>",
                quit = "q",
                go_action = "g",
            },
        },
        rename = {
            quit = "<C-c>",
            exec = "<CR>",
            in_select = true,
        },
        outline = {
            win_position = "right",
            win_with = "_sagaoutline",
            win_width = 30,
            show_detail = true,
            auto_preview = false,
            auto_refresh = true,
            auto_close = true,
            keys = {
                jump = "<CR>",
                expand_collapse = "u",
                quit = "q",
            },
        },
        symbol_in_winbar = {
            in_custom = true,
            enable = false,
            -- enable = true,
            separator = " > ",
            hide_keyword = true,
            show_file = false,
        },
        ui = {
            theme = "round",
            border = "rounded", -- Can be single, double, rounded, solid, shadow.
            winblend = 0,
            expand = "",
            collapse = "",
            preview = "",
            code_action = "",
            diagnostic = "",
            incoming = "",
            outgoing = "",
            kind = {
                -- Kind
                Class = { icons.kind.Class, "LspKindClass" },
                Constant = { icons.kind.Constant, "LspKindConstant" },
                Constructor = { icons.kind.Constructor, "LspKindConstructor" },
                Enum = { icons.kind.Enum, "LspKindEnum" },
                EnumMember = { icons.kind.EnumMember, "LspKindEnumMember" },
                Event = { icons.kind.Event, "LspKindEvent" },
                Field = { icons.kind.Field, "LspKindField" },
                File = { icons.kind.File, "LspKindFile" },
                Function = { icons.kind.Function, "LspKindFunction" },
                Interface = { icons.kind.Interface, "LspKindInterface" },
                Key = { icons.kind.Keyword, "LspKindKey" },
                Method = { icons.kind.Method, "LspKindMethod" },
                Module = { icons.kind.Module, "LspKindModule" },
                Namespace = { icons.kind.Namespace, "LspKindNamespace" },
                Number = { icons.kind.Number, "LspKindNumber" },
                Operator = { icons.kind.Operator, "LspKindOperator" },
                Package = { icons.kind.Package, "LspKindPackage" },
                Property = { icons.kind.Property, "LspKindProperty" },
                Struct = { icons.kind.Struct, "LspKindStruct" },
                TypeParameter = { icons.kind.TypeParameter, "LspKindTypeParameter" },
                Variable = { icons.kind.Variable, "LspKindVariable" },
                -- Type
                Array = { icons.type.Array, "LspKindArray" },
                Boolean = { icons.type.Boolean, "LspKindBoolean" },
                Null = { icons.type.Null, "LspKindNull" },
                Object = { icons.type.Object, "LspKindObject" },
                String = { icons.type.String, "LspKindString" },
                -- ccls-specific icons.
                TypeAlias = { icons.kind.TypeAlias, "LspKindTypeAlias" },
                Parameter = { icons.kind.Parameter, "LspKindParameter" },
                StaticMethod = { icons.kind.StaticMethod, "LspKindStaticMethod" },
                -- Microsoft-specific icons.
                Text = { icons.kind.Text, "LspKindText" },
                Snippet = { icons.kind.Snippet, "LspKindSnippet" },
                Folder = { icons.kind.Folder, "LspKindFolder" },
                Unit = { icons.kind.Unit, "LspKindUnit" },
                Value = { icons.kind.Value, "LspKindValue" },
            },
        },
    })
end
