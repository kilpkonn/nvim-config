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
        use {
            "wbthomason/packer.nvim",
            event = "VimEnter"
        }

        use {
            "nvim-lua/plenary.nvim",
        }

        use {
            "siduck76/nvim-base16.lua",
            after = "packer.nvim",
            config = function()
                require "theme"
            end
        }

        use {
            "kyazdani42/nvim-web-devicons",
            after = "nvim-base16.lua",
            config = function()
                require "plugins.configs.icons"
            end
        }

        use {
            "famiu/feline.nvim",
            after = "nvim-web-devicons",
            config = function()
               require "plugins.configs.statusline"
            end,
        }

        use {
            "akinsho/nvim-bufferline.lua",
            after = "nvim-base16.lua",
            config = function()
                require "plugins.configs.bufferline"
            end
        }

        use {
            "jdhao/better-escape.vim",
            event = "InsertEnter",
            config = function()
                require "plugins.configs.others".escape()
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
            "williamboman/nvim-lsp-installer",
            event = "VimEnter"
        }

        use {
            "neovim/nvim-lspconfig",
            after = "nvim-lsp-installer",
            config = function()
                require "plugins.configs.lspconfig"
            end
        }

        use {
          "nvim-lua/lsp_extensions.nvim",
          after = "nvim-lspconfig",
          config = function()
              require "plugins.configs.lsp_extensions"
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
            event = "InsertEnter",
        }

        use {
            "hrsh7th/nvim-cmp",
            after = {"friendly-snippets", "nvim-lspconfig"},
            config = function()
               require "plugins.configs.cmp"
            end,
        }

        use {
            "saadparwaiz1/cmp_luasnip",
            after = "LuaSnip",
        }

        use {
            "L3MON4D3/LuaSnip",
            wants = "friendly-snippets",
            after = "nvim-cmp",
            config = function()
               require("plugins.configs.others").luasnip()
            end,
         }

        use {
            "hrsh7th/cmp-nvim-lua",
            after = "nvim-cmp",
        }
        
        use {
            "hrsh7th/cmp-nvim-lsp",
            after = "nvim-cmp",
        }

        use {
            "hrsh7th/cmp-buffer",
            after = "nvim-cmp",
        }

        use {
            "hrsh7th/cmp-path",
            after = "nvim-cmp",
        }

        use {
            "hrsh7th/cmp-cmdline",
            after = "nvim-cmp",
        }

        use {
            "hrsh7th/cmp-calc",
            after = "nvim-cmp",
        }

        use {
            "sbdchd/neoformat",
            cmd = "Neoformat"
        }

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
          cmd = "Telescope",
          -- because cheatsheet is not activated by a teleacope command
          module = "cheatsheet",
          requires = {
             {
                "sudormrfbin/cheatsheet.nvim",
                after = "telescope.nvim",
                config = function()
                   -- TODO: Add custom bindings
                end,
             },
             {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
             },
             {
                "nvim-telescope/telescope-media-files.nvim",
             },
          },
          config = function()
             require "plugins.configs.telescope"
          end,
       }

        -- git stuff
        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require "plugins.configs.gitsigns"
            end
        }

        -- misc plugins
        use {
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = function()
                require "plugins.configs.autopairs"
            end
        }

        use {
            "andymass/vim-matchup",
            event = "CursorMoved"
        }

        use {
            "numToStr/Comment.nvim",
            event = "BufRead",
            config = function()
                require "plugins.configs.comment"
            end
        }

        use {
            "glepnir/dashboard-nvim",
            cmd = {
                "Dashboard",
                "DashboardNewFile",
                "DashboardJumpMarks",
                "SessionLoad",
                "SessionSave"
            },
            setup = function()
                require "plugins.configs.dashboard"
            end
        }

        -- load autosave only if its globally enabled
        use {
            "Pocco81/AutoSave.nvim",
            config = function()
                require "plugins.configs.autosave"
            end,
            cond = function()
                return vim.g.auto_save == true
            end
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
            "Pocco81/TrueZen.nvim",
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
            "DEVELOPEST/gtm-vim",
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
            config = function ()
              require "plugins.configs.dap"
            end
        }

        use {
            'theHamsta/nvim-dap-virtual-text',
            event = "BufRead",
            config = function ()
              require "plugins.configs.dap-virtual-text"
            end
        }

        use {
          'nvim-telescope/telescope-dap.nvim',
          event = "VimEnter"
        }

        use {
          'Pocco81/DAPInstall.nvim',
          event = "BufRead"
        }

        use {
          'sudormrfbin/cheatsheet.nvim',
          cmd = {
            'Cheatsheet'
          },
          requires = {
            {'nvim-telescope/telescope.nvim'},
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
          }
        }

        use {
          'folke/todo-comments.nvim',
          requires = { 'nvim-lua/plenary.nvim', 'nvim-base16.lua' },
          event = 'BufRead',
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

        -- Custom language plugins
        use { "ionide/Ionide-vim", after = "nvim-lspconfig", ft = { "fs", "fsx", "fsi" } }

    end
)
