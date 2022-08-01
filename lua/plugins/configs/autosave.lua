-- autosave.nvim plugin disabled by default
local present, autosave = pcall(require, "auto-save")
if not present then
  return
end

autosave.setup(
  {
  }
)
