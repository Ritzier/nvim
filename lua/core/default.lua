local M = {}
local script = require("core.script")

function M.lsp_servers()
    lsp_server = {}
    return lsp_server
end


function M.treesitter_servers()
    treesitter_server = {
        "bash",
        "c",
        "c_sharp",
        "cmake",
        "cpp",
        "css",
        "cuda",
        "dot",
        "elm",
        "fish",
        "go",
        "gomod",
        "gowork",
        "graphql",
        "hack",
        "haskell",
        "html",
        "html_tags",
        "http",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "jsx",
        "julia",
        "kotlin",
        "latex",
        "llvm",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "ninja",
        "perl",
        "php",
        "phpdoc",
        "python",
        "query",
        "r",
        "ruby",
        "rst",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "v",
        "vim",
        "vue",
        "yaml",
    }
    return treesitter_server
end

function M.neovide_config()
    vim.cmd([[set guifont=JetBrainsMono\ Nerd\ Font:h15]])
    vim.g.neovide_refresh_rate = 300
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_no_idle = true
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_cursor_trail_length = 0.05
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_vfx_opacity = 200.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
    vim.g.neovide_cursor_vfx_particle_speed = 20.0
    vim.g.neovide_cursor_vfx_particle_density = 5.0
end

function M.colorscheme()
    if script.check("catppuccin") then
        vim.cmd([[colorscheme catppuccin]])
    end
end

function M.load_config()
    require("core.options")
    require("core.mappings")
    require("plugins")
    M.colorscheme()
    M.neovide_config()
end

return M
