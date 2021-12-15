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
--fg_bg("Visual",light_grey, colors.lightbg)

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

vim.cmd("hi NvimTreeRootFolder gui=underline guifg=" .. purple)
bg("NvimTreeNormal", darker_black)
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
fg_bg("NvimTreeWindowPicker", red, black2)

-- telescope
fg("TelescopeBorder", line)
fg("TelescopePromptBorder", line)
fg("TelescopeResultsBorder", line)
fg("TelescopePreviewBorder", grey)

-- LspDiagnostics ---

-- error / warnings
fg("LspDiagnosticsSignError", red)
fg("LspDiagnosticsVirtualTextError", red)
fg("LspDiagnosticsSignWarning", yellow)
fg("LspDiagnosticsVirtualTextWarning", yellow)

-- info
fg("LspDiagnosticsSignInformation", green)
fg("LspDiagnosticsVirtualTextInformation", green)

-- hint
fg("LspDiagnosticsSignHint", purple)
fg("LspDiagnosticsVirtualTextHint", purple)

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

fg("CmpItemAbbrMatch", "#D2E4F4")
fg("CmpItemAbbr", "#90C0FF")
fg("CmpItemKind", "#E89A46")
fg("CmpItemMenu", "#107CC0")

-- packer's floating window

bg("NormalFloat", "NONE")
fg("FloatBorder", blue)

-- set bg color for nvim
-- bg("Normal", black)
