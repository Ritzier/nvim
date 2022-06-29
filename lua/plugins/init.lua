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


    end)
