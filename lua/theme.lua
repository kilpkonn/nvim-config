
vim.g.nvchad_theme = "onedark"
local present, base46 = pcall(require, "base46")

if present then
  base46.load_theme()
end
