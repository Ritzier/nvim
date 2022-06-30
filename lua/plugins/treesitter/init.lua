local present, treesitter = pcall(require, 'nvim-treesitter.configs')

if present then
    require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        highlight = { enable = true },
        indent = { enable = true },
        autopairs = { enable = true },
        context_commentstring = { enable=true, enable_autocmd = false },
        endwise = { enable = true },
        rainbow = { enable = true, extended_mode = true, max_file_lines = nil },
    })
end
