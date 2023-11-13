local present, _ = pcall(require, "plugins.packerInit")
local packer

if present then
  packer = require "packer"
else
  return false
end

local use = packer.use

return packer.startup(
  function()
    use { "wbthomason/packer.nvim", }
    use { "nvim-lua/plenary.nvim", }
    use { "andymass/vim-matchup", }

    use {
      "kilpkonn/base46",
      after = "plenary.nvim",
      config = function()
        require "theme"
      end
    }

    use {
      "kyazdani42/nvim-web-devicons",
      after = "base46",
    }

    use {
      "akinsho/nvim-bufferline.lua",
      after = "base46",
      config = function()
        require "plugins.configs.bufferline"
      end
    }

    use {
      "norcalli/nvim-colorizer.lua",
      event = "BufRead",
      config = function()
        require("plugins.configs.others").colorizer()
      end
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      event = "VimEnter",
      config = function()
        require "plugins.configs.treesitter"
      end
    }

    use {
      "williamboman/mason.nvim",
      config = function()
        require "plugins.configs.mason"
      end,
    }

    use {
      "williamboman/mason-lspconfig.nvim",
      after = "mason.nvim",
      config = function()
        require("mason-lspconfig").setup()
      end,
    }

    use {
      "neovim/nvim-lspconfig",
      after = "mason-lspconfig.nvim",
      event = "VimEnter",
      config = function()
        require "plugins.configs.lspconfig"
      end
    }

    use {
      "ray-x/lsp_signature.nvim",
      after = "nvim-lspconfig",
      config = function()
        require("plugins.configs.others").signature()
      end
    }

    use {
      "rafamadriz/friendly-snippets",
      event = "VimEnter",
    }

    use {
      "hrsh7th/nvim-cmp",
      after = { "friendly-snippets", "nvim-lspconfig" },
      config = function()
        require "plugins.configs.cmp"
      end,
    }

    use {
      "L3MON4D3/LuaSnip",
      wants = "friendly-snippets",
      after = "nvim-cmp",
      config = function()
        require("plugins.configs.others").luasnip()
      end,
    }

    use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip", }
    use { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp", }
    use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp", }
    use { "hrsh7th/cmp-buffer", after = "nvim-cmp", }
    use { "hrsh7th/cmp-path", after = "nvim-cmp", }
    use { "hrsh7th/cmp-cmdline", after = "nvim-cmp", }
    use { "hrsh7th/cmp-calc", after = "nvim-cmp", }
    use { "lukas-reineke/cmp-rg", after = "nvim-cmp" }

    -- file managing , picker etc
    use {
      "kyazdani42/nvim-tree.lua",
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
      config = function()
        require "plugins.configs.nvimtree"
      end
    }

    use {
      "nvim-lua/popup.nvim",
      after = "plenary.nvim"
    }

    use {
      "nvim-telescope/telescope.nvim",
      after = "plenary.nvim",
      requires = {
        { "nvim-lua/plenary.nvim" },
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          run = "make",
        },
        {
          "nvim-telescope/telescope-media-files.nvim",
        },
        {
          "nvim-telescope/telescope-ui-select.nvim",
        }
      },
      config = function()
        require "plugins.configs.telescope"
      end,
    }

    -- git stuff
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      },
      config = function()
        require "plugins.configs.gitsigns"
      end
    }

    -- misc plugins
    use{
      'altermo/ultimate-autopair.nvim',
      event={'InsertEnter','CmdlineEnter'},
      config=function ()
          require('ultimate-autopair').setup({
                  --Config goes here
                  })
      end,
    }
    use {
      "numToStr/Comment.nvim",
      event = "BufRead",
      config = function()
        require "plugins.configs.comment"
      end
    }

    use {
      "Pocco81/auto-save.nvim",
      branch = "dev",
      event = "BufRead",
      config = function()
        require "plugins.configs.autosave"
      end,
    }

    use {
      "jiaoshijie/undotree",
      config = function()
        require('undotree').setup()
      end,
      requires = {
        "nvim-lua/plenary.nvim",
      },
    }

    -- smooth scroll
    use {
      "karb94/neoscroll.nvim",
      event = "WinScrolled",
      config = function()
        require("plugins.configs.others").neoscroll()
      end
    }

    use {
      "Pocco81/true-zen.nvim",
      cmd = {
        "TZAtaraxis",
        "TZMinimalist",
        "TZFocus"
      },
      config = function()
        require "plugins.configs.zenmode"
      end
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      setup = function()
        require("plugins.configs.others").blankline()
      end
    }

    use {
      "wakatime/vim-wakatime",
      event = "BufRead"
    }

    use {
      "tpope/vim-fugitive",
      cmd = {
        "Git"
      }
    }

    use {
      'mfussenegger/nvim-dap',
      event = "BufRead",
      config = function()
        require "plugins.configs.dap"
      end
    }

    use {
      'theHamsta/nvim-dap-virtual-text',
      event = "BufRead",
      config = function()
        require "plugins.configs.dap-virtual-text"
      end
    }

    use {
      'nvim-telescope/telescope-dap.nvim',
      event = "VimEnter"
    }

    use {
      'sudormrfbin/cheatsheet.nvim',
      cmd = {
        'Cheatsheet'
      },
      requires = {
        { 'nvim-telescope/telescope.nvim' },
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
      }
    }

    use {
      'folke/todo-comments.nvim',
      after = { 'plenary.nvim', 'base46' },
      config = function()
        require "plugins.configs.todo-comments"
      end
    }

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require "plugins.configs.trouble"
      end
    }

    use {
      "tpope/vim-dadbod",
      cmd = { "DB" }
    }

    use {
      "m4xshen/hardtime.nvim",
      config = function()
        require("hardtime").setup()
      end
    }

    -- Custom language plugins
    use { "ionide/Ionide-vim", after = "nvim-lspconfig", ft = { "fs", "fsx", "fsi" } }
    use { 'kilpkonn/rust-tools.nvim', branch = "item_tree" }
    use { 'michaelb/sniprun', run = 'bash ./install.sh' }
    use {'kaarmu/typst.vim', ft = {'typst'}}
    end
)
