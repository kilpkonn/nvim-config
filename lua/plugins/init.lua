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
      "folke/trouble.nvim",
      config = function()
        require "plugins.configs.trouble"
      end
    }

    use {
      "tpope/vim-dadbod",
      cmd = { "DB" }
    }

    -- Custom language plugins
    -- use { 'michaelb/sniprun', run = 'bash ./install.sh' }
    use { "nushell/tree-sitter-nu" }
    end
)
