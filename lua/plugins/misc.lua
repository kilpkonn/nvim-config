vim.pack.add({
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
  { src = 'https://github.com/wakatime/vim-wakatime' },
  { src = 'https://github.com/tpope/vim-fugitive' },
  { src = 'https://github.com/tpope/vim-dadbod' },
  { src = 'https://github.com/folke/trouble.nvim' },
})

require('nvim-autopairs').setup({})

require("ibl").setup({
    scope = { show_start = false, show_end = false, },
})
