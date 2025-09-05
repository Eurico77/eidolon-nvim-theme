-- eidolon.nvim/lua/eidolon/init.lua

local palette = require("eidolon.palette")

-- Função auxiliar para definir highlights
-- group: O nome do highlight group (ex: "Normal")
-- colors: Uma tabela com fg, bg, style (ex: { fg = palette.foreground, bg = palette.background, style = "NONE" })
local function highlight(group, colors)
  local style = colors.style and "style=" .. colors.style or "style=NONE"
  local fg = colors.fg and "guifg=" .. colors.fg or "guifg=NONE"
  local bg = colors.bg and "guibg=" .. colors.bg or "guibg=NONE"
  local sp = colors.sp and "guisp=" .. colors.sp or ""

  vim.cmd("highlight " .. group .. " " .. fg .. " " .. bg .. " " .. style .. " " .. sp)
end

-- Função principal para carregar o tema
local function load()
  -- Limpa highlights anteriores e define o fundo
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.background = "dark"
  vim.g.colors_name = "eidolon"

  -- Configura as cores do terminal
  vim.g.terminal_color_0 = palette.ansi.black
  vim.g.terminal_color_1 = palette.ansi.red
  vim.g.terminal_color_2 = palette.ansi.green
  vim.g.terminal_color_3 = palette.ansi.yellow
  vim.g.terminal_color_4 = palette.ansi.blue
  vim.g.terminal_color_5 = palette.ansi.magenta
  vim.g.terminal_color_6 = palette.ansi.cyan
  vim.g.terminal_color_7 = palette.ansi.white
  vim.g.terminal_color_8 = palette.ansi.bright_black
  vim.g.terminal_color_9 = palette.ansi.bright_red
  vim.g.terminal_color_10 = palette.ansi.bright_green
  vim.g.terminal_color_11 = palette.ansi.bright_yellow
  vim.g.terminal_color_12 = palette.ansi.bright_blue
  vim.g.terminal_color_13 = palette.ansi.bright_magenta
  vim.g.terminal_color_14 = palette.ansi.bright_cyan
  vim.g.terminal_color_15 = palette.ansi.bright_white

  -- === Highlights da UI do Neovim ===
  highlight("Normal", { fg = palette.foreground, bg = palette.background })
  highlight("Cursor", { fg = palette.background, bg = palette.cursor })
  highlight("CursorLine", { bg = palette.ui_highlight })
  highlight("Visual", { bg = palette.selection })
  highlight("LineNr", { fg = palette.comment })
  highlight("Pmenu", { fg = palette.ui_foreground, bg = palette.ui_background })
  highlight("PmenuSel", { fg = palette.foreground, bg = palette.selection })
  highlight("SignColumn", { fg = palette.foreground, bg = palette.background })
  highlight("StatusLine", { fg = palette.ui_foreground, bg = palette.ui_highlight })
  highlight("StatusLineNC", { fg = palette.comment, bg = palette.ui_highlight })
  highlight("TabLine", { fg = palette.comment, bg = palette.ui_highlight })
  highlight("TabLineSel", { fg = palette.foreground, bg = palette.blue })
  highlight("VertSplit", { fg = palette.ui_border, bg = palette.background })
  highlight("ColorColumn", { bg = palette.ui_highlight })
  highlight("Folded", { fg = palette.comment, bg = palette.ui_highlight })

  -- === Highlights de Sintaxe ===
  highlight("Comment", { fg = palette.comment, style = "NONE" })
  highlight("String", { fg = palette.yellow })
  highlight("Number", { fg = palette.green })
  highlight("Boolean", { fg = palette.purple })
  highlight("Constant", { fg = palette.purple })
  highlight("Character", { fg = palette.link })

  highlight("Keyword", { fg = palette.violet, style = "NONE" })
  highlight("Statement", { fg = palette.violet })
  highlight("Operator", { fg = palette.link })

  highlight("Function", { fg = palette.blue })
  highlight("Identifier", { fg = palette.foreground })
  highlight("PreProc", { fg = palette.pink })
  highlight("Type", { fg = palette.link })
  highlight("StorageClass", { fg = palette.pink })
  highlight("Structure", { fg = palette.link })

  highlight("Title", { fg = palette.blue, style = "bold" })
  highlight("Todo", { fg = palette.background, bg = palette.yellow, style = "bold" })
  highlight("Error", { fg = palette.red, bg = palette.background, style = "bold" })
  highlight("Underlined", { fg = palette.link, style = "underline" })

  -- Links
  highlight("Function.macro", { fg = palette.cyan })
  highlight("Macro", { fg = palette.cyan })
  highlight("Special", { fg = palette.cyan })
  highlight("Tag", { fg = palette.pink })
  highlight("Delimiter", { fg = palette.foreground })

  -- Diffs
  highlight("DiffAdd", { bg = "#74d2b720" })
  highlight("DiffChange", { bg = "#87bff720" })
  highlight("DiffDelete", { bg = "#bd427720" })
  highlight("DiffText", { bg = "#87bff740" })

  -- Links para highlights padrão
  vim.cmd("highlight link SpecialKey Normal")
  vim.cmd("highlight link NonText Comment")
  vim.cmd("highlight link Conceal Normal")
end

return {
  load = load,
}
