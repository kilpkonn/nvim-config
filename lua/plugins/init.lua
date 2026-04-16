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
    use { "andymass/vim-matchup", }

    use {
      "rafamadriz/friendly-snippets",
      event = "VimEnter",
    }

    use {
      "hrsh7th/nvim-cmp",
      after = { "friendly-snippets" },
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

    use {
      "nvim-lua/popup.nvim",
    }

    use {
      "nvim-telescope/telescope.nvim",
      requires = {
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
      }
    }

    use {
      'folke/todo-comments.nvim',
      config = function()
        require "plugins.configs.todo-comments"
      end
    }

    use {
      "folke/trouble.nvim",
      config = function()
        require "plugins.configs.trouble"
      end
    }

    use {
      "tpope/vim-dadbod",
      cmd = { "DB" }
    }

    use {
      'MeanderingProgrammer/markdown.nvim',
      as = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
      ft = { "md" },
      config = function()
          require('render-markdown').setup({})
      end,
    }

    -- use {
    --   "m4xshen/hardtime.nvim",
    --   config = function()
    --     require("hardtime").setup()
    --   end
    -- }

    -- Custom language plugins
    -- use { 'michaelb/sniprun', run = 'bash ./install.sh' }
    use { "nushell/tree-sitter-nu" }
    end
)
