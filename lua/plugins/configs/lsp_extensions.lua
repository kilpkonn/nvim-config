
local present, extensions = pcall(require, "lsp_extensions")

if not present then
   return
end

extensions.inlay_hints{
    highlight = "InlayHint",
    prefix = " => ",
    aligned = false,
    only_current_line = false,
    enabled = { "ChainingHint" }
}


vim.cmd [[ autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ highlight = "InlayHint", prefix = " => ", aligned = false, only_current_line = false, enabled = {"TypeHint", "ChainingHint", "ParameterHint"} } ]]
