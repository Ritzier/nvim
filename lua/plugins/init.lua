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
        'EdenEast/nightfox.nvim'
    }

    -- Icons
    use {
        "kyazdani42/nvim-web-devicons"
    }

    -- Bufferline
    use {
        "akinsho/bufferline.nvim",
        config = req("nvim_bufferline"),
    }

    -- File Explorer
    use {
        "kyazdani42/nvim-tree.lua",
        config = req("nvim_tree"),
    }
    
    -- Change notification
    use {
        "rcarriga/nvim-notify",
        config = req("nvim_notify")
    }

    -- lualine
    use {
    }

    -- Nvim gps
    use {
        "SmiteshP/nvim-gps",
        config = req("nvim_gps")
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = req("treesitter")
    }
    use {
        "p00f/nvim-ts-rainbow",
        event = "BufRead",
        after = "nvim-treesitter",
    }
    use {
        "RRethy/nvim-treesitter-endwise",
        after = "nvim-treesitter",
    }
    use {
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter",
    }
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        after = "nvim-treesitter",
    }

    -- Colorizer
    use {
        "NvChad/nvim-colorizer.lua",
        event = "BufRead",
        opt = true,
        config = req("colorizer")
    }

    -- Markdown Preview
    use {
        "iamcco/markdown-preview.nvim",
        run = 'cd app && yarn',
        cmd = { 'MarkdownPreview', 'MarkdownPreviewStop' },
        setup = function()
            vim.g.mkdp_filetypes = { 'markdown' }
            vim.g.mkdp_auto_close = 0
        end,
        ft = { 'markdown' },
    }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        module = 'telescope',
        cmd = 'Telescope',
        config = req("telescope")
    }

    -- Git
    use {
        "lewis6991/gitsigns.nvim",
        opt = true,
        config = req("gitsigns")
    }

    -- IndentBlankline
    use {
        "lukas-reineke/indent-blankline.nvim",
        after = "nvim-treesitter",
        config = req("blankline"),
    }

    -- Comment
    use {
        "numToStr/Comment.nvim",
        module = "Comment",
        keys = { { 'n', 'gcc' }, { 'v', 'gc' } },
        config = req("comment")
    }


    -- Terminal
    use {
    }


    end)
