require "options"
require "mappings"
require "autocmds"

require "plugins.configs.lspconfig"

-- Packer commands till because we are not loading it at startup
vim.cmd("silent! command PackerCompile lua require 'plugins' require('packer').compile()")
vim.cmd("silent! command PackerInstall lua require 'plugins' require('packer').install()")
vim.cmd("silent! command PackerStatus lua require 'plugins' require('packer').status()")
vim.cmd("silent! command PackerSync lua require 'plugins' require('packer').sync()")
vim.cmd("silent! command PackerUpdate lua require 'plugins' require('packer').update()")
