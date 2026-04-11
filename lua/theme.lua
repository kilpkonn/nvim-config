vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/kilpkonn/base46' },
  { src = 'https://github.com/kyazdani42/nvim-web-devicons' },
  { src = 'https://github.com/akinsho/nvim-bufferline.lua' },
  { src = 'https://github.com/catgoose/nvim-colorizer.lua' },
  { src = 'https://github.com/kyazdani42/nvim-tree.lua' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
})

vim.g.nvchad_theme = "onedark"
require("base46").load_all_highlights()

require("bufferline").setup({
   options = {
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      show_close_icon = false,
      left_trunc_marker = " ",
      right_trunc_marker = " ",
      max_name_length = 20,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      show_buffer_close_icons = true,
      separator_style = "thin",
      themable = true,

      -- top right buttons in bufferline
      custom_areas = {
         right = function()
            return {
               { text = "%@Quit_vim@ %X" },
            }
         end,
      },
   },
})

require("colorizer").setup()

require("nvim-tree").setup({
   filters = {
      dotfiles = false,
      custom = { ".git", "node_modules", ".cache" },
   },
   renderer = {
    highlight_git = false,
    highlight_opened_files = "none",
    indent_markers = {
      enable = true,
    },
    icons = {
       padding = " ",
       symlink_arrow = " ➛ ",
       show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = false,
       },
       glyphs = {
          default = "",
          symlink = "",
          folder = {
             default = "",
             empty = "",
             empty_open = "",
             open = "",
             symlink = "",
             symlink_open = "",
             arrow_open = "",
             arrow_closed = "",
          },
          git = {
             unstaged = "✗",
             staged = "✓",
             unmerged = "",
             renamed = "➜",
             untracked = "★",
             deleted = "",
             ignored = "◌",
          },
       },
    },
  },
})

require('gitsigns').setup({
    signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" }
    },
    signcolumn = false,
    numhl = true,
    watch_gitdir = {
      interval = 1000,
      follow_files = true
    },
    sign_priority = 6,
    status_formatter = nil -- Use default
})

-- require('vim._core.ui2').enable({})
