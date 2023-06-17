local present, gitsigns = pcall(require, "gitsigns")
if not present then
    return
end

gitsigns.setup {
    signs = {
        add = {hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr"},
        change = {hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr"},
        delete = {hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr"},
        topdelete = {hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr"},
        changedelete = {hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr"}
    },
    signcolumn = false,
    numhl = true,
    watch_gitdir = {
      interval = 1000,
      follow_files = true
    },
    sign_priority = 6,
    status_formatter = nil -- Use default
}
