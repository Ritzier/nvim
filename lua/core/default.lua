local M = {}
local script = require("core.script")

function M.lsp_servers()
    lsp_server = {}
    return lsp_server
end


function M.treesitter_servers()
    treesitter_server = "all"
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

function M.colorscheme_catppuccin()
    if script.check("catppuccin") then
        vim.cmd([[colorscheme catppuccin]])
    end
end

function M.colorscheme_duskfox()
    if script.check("nightfox") then
        vim.cmd([[colorscheme duskfox]])
    end
end

function M.load_config()
    require("core.options")
    require("core.mappings").default_mappings()
    require("plugins")
    M.colorscheme_duskfox()
    M.neovide_config()
end

return M
