-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)

  -- Load lua path
    local lua_path = function(name)
        return string.format("require'plugins.%s'", name)
    end

    local function req(module)
        require("plugins." .. module)
    end

    use { 'wbthomason/packer.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-lua/popup.nvim' }
    use { 'lewis6991/impatient.nvim' }

    -- Colorscheme
    use { 
        'catppuccin/nvim',
        as = 'catppuccin',
        config = req("catppuccin")
    }
    use {
        'EdenEast/nightfox.nvim'
    }

    -- Icons
    use { "kyazdani42/nvim-web-devicons" }

    -- NvimTree
    use {
        'kyazdani42/nvim-tree.lua',
        config = req("nvim_tree")
    }

    -- Buferline
    use {
        'akinsho/bufferline.nvim',
        config = req("bufferline")
    }

    -- Alpha
    use {
        "goolord/alpha-nvim",
        --config = req("alpha")
    }

    -- Notify
    use {
        "rcarriga/nvim-notify",
        config = req("nvim_notify"),
    }

    -- Gitsigns
    use {
        "lewis6991/gitsigns.nvim",
        config = req("gitsigns"),
        requires = {"nvim-lua/plenary.nvim"},
    }

    -- Treesitter
    use {
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup({
                hook = function()
                    require("ts_context_commentstring.internal").update_commentstring()
                end,
            })
        end,
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = req("treesitter")
    }
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
    }
    use {
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
    }
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        after = "nvim-treesitter"
    }
    use {
        "mfussenegger/nvim-ts-hint-textobject",
        after = "nvim-treesitter",
    }
    use {
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter",
        config = req("autotag")
    }
    use {
        "andymass/vim-matchup",
        after = "nvim-treesitter",
        config = function()
            vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
        end
    }

    --Colorizer
    use {
        "norcalli/nvim-colorizer.lua",
        config = req("colorizer")
    }

    -- Bufdelete
    use {
        "famiu/bufdelete.nvim",
        cmd = { "Bdelete", "Bwipeout", "Bdelete!", "Bwipeout!" },
    }
    
    -- Align
    use {
        "junegunn/vim-easy-align",
        cmd = { "EasyAlign" }
    }

    -- IndentBlankline
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = req("indent_blankline"),
        requires = "nvim-treesitter",
    }

    -- NvimGPS
    use {
        "SmiteshP/nvim-gps",
        config = req("nvim_gps")
    }

    -- Status Line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt=true},
        config = req("lualine")
    }

end)
