local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use({ "wbthomason/packer.nvim" })
  use({ "lewis6991/impatient.nvim" })
  use({
    "antoinemadec/FixCursorHold.nvim",
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  })
  use({ "dstein64/vim-startuptime" })

  -- Colorshceme
  use({ "EdenEast/nightfox.nvim" })
  use({ "Ritzier/blackdusk" })
  use({ "pineapplegiant/spaceduck" })
  use({ "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("colorscheme.catppuccin")
    end
  })
  use({ "katawful/kat.nvim" })
  use({ "sainnhe/edge", config = function() require("colorscheme.edge") end })
  use({ "shaunsingh/nord.nvim", config = function() require("colorscheme.nord") end })

  -- Icons
  use({ "kyazdani42/nvim-web-devicons" })

  -- StatusLine
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configuration.lualine")
    end,
  })

  -- Bufferline
  use({
    "akinsho/bufferline.nvim",
    config = function()
      require("configuration.bufferline")
    end,
  })

  -- NvimTree
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("configuration.nvimtree")
    end,
  })

  use({
    "sindrets/winshift.nvim",
    config = function()
      require("configuration.winshift")
    end
  })

  -- TreeSitter
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      { "windwp/nvim-ts-autotag" },
      { "RRethy/nvim-treesitter-endwise" },
      { "p00f/nvim-ts-rainbow" },
      {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
          require("configuration.tree_sitter.indent-line")
        end
      },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      { "nvim-treesitter/playground" },
      { "andymass/vim-matchup" },
    },
    config = function()
      require("configuration.tree_sitter")
    end,
    run = ":TSUpdate",
  })

  -- Legendary
  use({
    "mrjones2014/legendary.nvim",
    opt = true,
    keys = { [[<C-p>]] },
    -- wants = { "dressing.nvim" },
    module = { "legendary" },
    cmd = { "Legendary" },
    config = function()
      require("configuration.legendary")
    end,
    -- requires = { "stevearc/dressing.nvim" },
  })

  -- Todo
  use({
    "folke/todo-comments.nvim",
    config = function()
      require("configuration.todo-comments")
    end,
  })

  -- Wilder
  use({
    "gelguy/wilder.nvim",
    config = function()
      require("configuration.wilder")
    end,
  })

  -- Comment
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configuration.gitsigns")
    end,
  })

  -- WhichKey
  use({
    "folke/which-key.nvim",
    config = function()
      require("configuration.which_key")
    end,
  })

  -- Nvim in browser
  use({
    "glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end,
    enable = false,
  })

  -- Align
  use({
    "junegunn/vim-easy-align",
    cmd = "EasyAlign",
  })

  -- UserInterface
  use({
    "stevearc/dressing.nvim",
    config = function()
      require("configuration.dressing")
    end,
    requires = {
      {
        "MunifTanjim/nui.nvim",
        config = function()
          require("configuration.nui")
        end,
      },
    },
  })

  -- Color
  use({
    "uga-rosa/ccc.nvim",
    config = function()
      require("configuration.ccc")
    end,
  })
  use({
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({
        render = "background",
        enable_tailwind = true,
      })
      require("nvim-highlight-colors").turnOn()
    end,
  })

  -- Terminal
  use({
    "akinsho/toggleterm.nvim",
    config = function()
      require("configuration.toggleterm")
    end,
  })

  -- Sudo
  use({ "lambdalisue/suda.vim" })

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    requires = {
      { "nvim-lua/completion-nvim" },
      { "williamboman/mason.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      {
        "ray-x/lsp_signature.nvim",
        config = function()
          require("lsp-config.lsp_signature")
        end,
      },
      {
        "j-hui/fidget.nvim",
        config = function()
          require("fidget").setup()
        end,
      },
      {
        "creativenull/efmls-configs-nvim",
        config = function()
          require("lsp-config.efm")
        end,
      },
      {
        "glepnir/lspsaga.nvim",
        config = function()
          require("lsp-config.lspsaga")
        end,
      },
      { "RRethy/vim-illuminate" },
      {
        "rmagatti/goto-preview",
        config = function()
          require("lsp-config.goto")
        end,
      },
      {
        "SmiteshP/nvim-navic",
        config = function()
          require("lsp-config.navic")
        end,
      },
      {
        "SmiteshP/nvim-gps",
        config = function()
          require("lsp-config.gps")
        end,
      },
      {
        "folke/trouble.nvim",
        config = function()
          require("lsp-config.trouble")
        end
      },

      { "folke/neodev.nvim" },
      { "p00f/clangd_extensions.nvim" },
      {
        "simrat39/rust-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim", "mattn/webapi-vim" },
      },
      {
        "saecki/crates.nvim",
        config = function()
          require("crates").setup()
        end,
      },
      {
        "simrat39/inlay-hints.nvim",
        config = function()
          require("lsp-config.inlay-hints")
        end
      },
      { "jose-elias-alvarez/typescript.nvim" },
      { "b0o/schemastore.nvim" },
      { "mfussenegger/nvim-jdtls", ft = { "java" } },
      { "udalov/kotlin-vim", ft = { "kotlin" }, disable = true },
      { "yuezk/vim-js" },
      { "HerringtonDarkholme/yats.vim" },
      { "maxmellon/vim-jsx-pretty" },
      { "dart-lang/dart-vim-plugin" },
      { "natebosch/vim-lsc" },
      { "natebosch/vim-lsc-dart" },
      { "nanotee/sqls.nvim" },
    },
    config = function()
      require("lsp-config")
    end,
  })

  use({
    "echasnovski/mini.nvim",
    config = function()
      require("configuration.mini_pairs")
    end
  })

  -- CMP
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("cmp-config.luasnip")
        end,
        requires = "rafamadriz/friendly-snippets",
      },
      { "lukas-reineke/cmp-under-comparator" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "andersevenrud/cmp-tmux" },
      { "hrsh7th/cmp-path" },
      { "f3fora/cmp-spell" },
      { "hrsh7th/cmp-buffer" },
      { "kdheepak/cmp-latex-symbols" },
    },
    config = function()
      require("cmp-config")
    end,
  })

  -- Autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("configuration.nvim_autopairs")
    end,
    after = { "nvim-cmp", "nvim-treesitter" },
  })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope-config")
    end,
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-lua/popup.nvim" },
      { "jvgrootveld/telescope-zoxide" },
      { "nvim-telescope/telescope-project.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-dap.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        requires = { "tami5/sqlite.lua" },
        run = "make",
      },
      { "nvim-telescope/telescope-media-files.nvim" },
      { "dhruvmanila/telescope-bookmarks.nvim" },
      { "nvim-telescope/telescope-github.nvim" },
      { "nvim-telescope/telescope-symbols.nvim" },
      { "nvim-telescope/telescope-frecency.nvim", requires = { "kkharji/sqlite.lua" } },
      { "cljoly/telescope-repo.nvim" },
      {
        "alpha2phi/telescope-arecibo.nvim",
        rocks = { "openssl", "lua-http-parser" },
      },
      {
        "AckslD/nvim-neoclip.lua",
        requires = {
          { "tami5/sqlite.lua", module = "sqlite" },
          -- config = function()
          --   require("neoclip").setup()
          -- end,
        },
      },
      { "Zane-/cder.nvim" }
    },
  })

  -- DAP - debugger
  use({
    "mfussenegger/nvim-dap",
    opt = true,
    -- event = "BufReadPre",
    keys = { [[<leader>d]] },
    module = { "dap" },
    wants = { "nvim-dap-virtual-text", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
    requires = {
      -- "alpha2phi/DAPInstall.nvim",
      -- { "Pocco81/dap-buddy.nvim", branch = "dev" },
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
      { "leoluz/nvim-dap-go", module = "dap-go" },
      { "jbyuki/one-small-step-for-vimkind", module = "osv" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("dap-config").setup()
    end,
    disable = false,
  })

  -- Run file
  use({
    "stevearc/overseer.nvim",
    config = function()
      require("configuration.overseer")
    end,
  })
  use({
    "nvim-neotest/neotest",
    wants = {
      "plenary.nvim",
      "neotest-python",
      "neotest-plenary",
      "neotest-go",
      "neotest-jest",
      "neotest-vim-test",
      "neotest-dart",
      "neotest-dotnet",
      "neotest-scala",
      "neotest-rust",
      "vim-test",
      "overseer.nvim",
    },
    requires = {
      "vim-test/vim-test",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-go",
      "haydenmeade/neotest-jest",
      "nvim-neotest/neotest-vim-test",
      "rouge8/neotest-rust",
      "sidlatau/neotest-dart",
      "Issafalcon/neotest-dotnet",
      "stevanmilic/neotest-scala",
    },
    module = { "neotest", "neotest.async" },
    config = function()
      require("configuration.neotest")
    end
  })

  -- FileType
  use({
    "ray-x/go.nvim",
    ft = { "go" },
    config = function()
      requrie("go").setup()
    end,
  })
  use({
    "habamax/vim-godot",
  })
  use({
    "rust-lang/rust.vim",
    ft = "rust",
  })
  use({
    "chrisbra/csv.vim",
    ft = "csv",
  })

  use({
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    run = "cd app && yarn install",
  })

  use({
    "akinsho/flutter-tools.nvim",
    config = function()
      require("configuration.flutter-tools")
    end,
  })

  use({ "ziglang/zig.vim" })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
