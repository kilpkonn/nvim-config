local cmd = vim.cmd

local global_theme = "themes/" .. vim.g.nvchad_theme
local colors = require(global_theme)

local white = colors.white
local darker_black = colors.darker_black
local black = colors.black
local black2 = colors.black2
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local one_bg3 = colors.one_bg3
local light_grey = colors.light_grey
local grey = colors.grey
local grey_fg = colors.grey_fg
local grey_fg2 = colors.grey_fg2
local red = colors.red
local line = colors.line
local green = colors.green
local nord_blue = colors.nord_blue
local blue = colors.blue
local yellow = colors.yellow
local purple = colors.purple

-- for guifg , bg

local function fg(group, color)
    cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
    cmd("hi " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

local function cl(group)
    cmd("hi clear " .. group)
end

-- blankline
fg("IndentBlanklineChar", line)

-- misc --
fg("LineNr", grey)
fg("Comment", grey_fg)
fg("NvimInternalError", red)
fg("VertSplit", line)
fg("EndOfBuffer", black)
fg_bg("SignColumn", "#abb2bf", "#1e222a")

-- Pmenu
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuSel", green)
bg("PmenuThumb", nord_blue)

-- inactive statuslines as thin splitlines
cmd("hi! StatusLineNC gui=underline guifg=" .. line)

-- line n.o
cmd "hi clear CursorLine"
fg("cursorlinenr", white)

-- git signs ---
cl("DiffAdd")
bg("DiffAdd", "#012800")
cl("DiffChange")
bg("DiffChange", "#082040")
cl("DiffModified")
bg("DiffModified", "#340001")

-- NvimTree
fg("NvimTreeFolderIcon", blue)
fg("NvimTreeFolderName", blue)
fg("NvimTreeOpenedFolderName", blue)
fg("NvimTreeEmptyFolderName", blue)
fg("NvimTreeIndentMarker", one_bg2)
fg("NvimTreeVertSplit", darker_black)
bg("NvimTreeVertSplit", darker_black)
fg("NvimTreeEndOfBuffer", darker_black)

cmd("hi NvimTreeRootFolder gui=underline guifg=" .. purple)
bg("NvimTreeNormal", darker_black)
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
fg_bg("NvimTreeWindowPicker", red, black2)

-- telescope
fg("TelescopeBorder", line)
fg("TelescopePromptBorder", line)
fg("TelescopeResultsBorder", line)
fg("TelescopePreviewBorder", grey)

-- LspDiagnostics ---

fg("DiagnosticWarn", "#FBBF24")
fg("DiagnosticError", "#DC2626")
fg("DiagnosticInfo", "#2563EB")
fg("DiagnosticHint", "#10B981")

-- dashboard

fg("DashboardHeader", grey_fg)
fg("DashboardCenter", grey_fg)
fg("DashboardShortcut", grey_fg)
fg("DashboardFooter", grey_fg)

-- Other
fg("TSField", "#D2E4F4")
fg("TSFloat", "#B587D4")
fg("TSNumber", "#B587D4")
fg("TSBoolean", "#B587D4")
fg("TSOperator", "#66C1F8")
fg("TSNamespace", "#51D3D3")
fg("TSPunctBracket", "#E89A46")
fg("TSTypeBuiltin", "#BA6BD7")
fg("TSConstant", "#E89A46")
fg("TSConstantBuiltin", "#BA6BD7")
fg("TSRepeat", "#E06C75")

fg("InlayHint", "#1070A0")

-- packer's floating window

bg("NormalFloat", "NONE")
fg("FloatBorder", blue)

-- set bg color for nvim
-- bg("Normal", black)

-- Nvim cmp
fg("CmpItemMenu", "#107CC0")
cmd [[highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080]]
cmd [[highlight! link CmpItemAbbrMatchFuzzy TSFunction]]
cmd [[highlight! link CmpItemAbbrMatch TSFunction]]
cmd [[highlight! link CmpItemAbbr TSText]]
cmd [[highlight! link CmpItemKindText TSText]]
cmd [[highlight! link CmpItemKindMethod TSMethod]]
cmd [[highlight! link CmpItemKindFunction TSFunction]]
cmd [[highlight! link CmpItemKindConstructor TSConstructor]]
cmd [[highlight! link CmpItemKindField TSField]]
cmd [[highlight! link CmpItemKindVariable TSField]]
cmd [[highlight! link CmpItemKindClass TSConstant]]
cmd [[highlight! link CmpItemKindInterface TSTypeBuiltin]]
cmd [[highlight! link CmpItemKindValue TSNumber]]
cmd [[highlight! link CmpItemKindKeyword TSKeyword]]
cmd [[highlight! link CmpItemKindSnippet TSFuncBuiltin]]
cmd [[highlight! link CmpItemKindFile TSURI]]
cmd [[highlight! link CmpItemKindFolder TSURI]]

