local present1, treesitter = pcall(require, "nvim-treesitter")

if present1 then
    require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        sync_install = false,
        highlight = { enable = true },
        rainbow = { 
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        },



         -- endwise
        endwise = {
            enable = true,
        },

        -- autotag
        autotag = {
            enable = true,
        },

        -- context_commentstring
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
    })
end
