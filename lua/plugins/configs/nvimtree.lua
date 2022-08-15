local present, nvimtree = pcall(require, "nvim-tree")
if not present then
    return
end

nvimtree.setup {
   filters = {
      dotfiles = false,
      custom = { ".git", "node_modules", ".cache" },
   },
   diagnostics = {
      enable = false,
      icons = {
         hint = "",
         info = "",
         warning = "",
         error = "",
      },
   },
   hijack_netrw = false,
   ignore_ft_on_setup = { "dashboard" },
   open_on_tab = false,
   hijack_cursor = true,
   update_cwd = false,
   update_focused_file = {
      enable = true,
      update_cwd = false,
   },
   view = {
      side = "left",
      width = 25,
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
}
