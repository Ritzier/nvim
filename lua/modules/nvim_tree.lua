require("nvim-tree").setup({
    disable_netrw = false,
    hijack_netrw = false,
    hijack_cursor = true,
    update_cwd = true,
    ignore_ft_on_setup = { "dashboard" },
    reload_on_bufenter = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    view = {
        side = "left",
        width = "28%",
        hide_root_folder = false,
        signcolumn = "yes",
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = true,
            restrict_above_cwd = false,
        },
        open_file = {
            resize_window = true,
            window_picker = {
                enable = true,
            },
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    filters = {
        dotfiles = false,
        custom = { "node_modules", "\\.cache", "__pycache__" },
        exclude = {},
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            }
        },
        add_trailing = true,
        highlight_git = true,
        highlight_opened_files = "none",
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "", --
                    unmerged = "שׂ",
                    renamed = "", --
                    untracked = "ﲉ",
                    deleted = "",
                    ignored = "", --◌
                },
            },
        },
    },
})
