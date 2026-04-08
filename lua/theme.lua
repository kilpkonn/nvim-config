vim.pack.add({
  { src = 'https://github.com/kilpkonn/base46' },
  { src = 'https://github.com/kyazdani42/nvim-web-devicons' },
  { src = 'https://github.com/akinsho/nvim-bufferline.lua' },
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
