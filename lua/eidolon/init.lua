-- eidolon.nvim/lua/eidolon/init.lua

local config = require("eidolon.config")
local palettes = require("eidolon.palettes")

-- Função auxiliar para definir highlights
local function highlight(group, colors)
  local val = {}
  if colors.fg then val.fg = colors.fg end
  if colors.bg then val.bg = colors.bg end
  if colors.style then val.style = colors.style else val.style = "NONE" end
  if colors.sp then val.sp = colors.sp end
  vim.api.nvim_set_hl(0, group, val)
end

-- Função auxiliar para lincar highlights
local function link(group, target)
  vim.api.nvim_set_hl(0, group, { link = target, default = true })
end

-- Função interna que aplica os highlights com base na paleta e estilo
local function _apply_highlights(palette, style)
  -- === Highlights da UI do Neovim (comuns a maioria dos temas) ===
  highlight("Normal", { fg = palette.foreground, bg = palette.background })
  highlight("Cursor", { fg = palette.background, bg = palette.cursor })
  highlight("CursorLine", { bg = palette.ui_highlight })
  highlight("Visual", { bg = palette.selection })
  highlight("LineNr", { fg = palette.comment })
  highlight("Pmenu", { fg = palette.ui_foreground, bg = palette.ui_background })
  highlight("PmenuSel", { fg = palette.foreground, bg = palette.selection })
  highlight("SignColumn", { fg = palette.foreground, bg = palette.background })
  highlight("StatusLine", { fg = palette.ui_foreground, bg = palette.ui_border })
  highlight("StatusLineNC", { fg = palette.comment, bg = palette.ui_highlight })
  highlight("TabLine", { fg = palette.comment, bg = palette.ui_highlight })
  highlight("TabLineSel", { fg = palette.foreground, bg = palette.blue or palette.link })
  highlight("VertSplit", { fg = palette.ui_border, bg = palette.background })
  highlight("ColorColumn", { bg = palette.ui_highlight })
  highlight("Folded", { fg = palette.comment, bg = palette.ui_highlight })

  -- === Highlights de Sintaxe (podem variar por estilo) ===
  if style == "alternativo" then
    -- Estilo alternativo tem regras mais específicas
    highlight("Comment", { fg = palette.comment, style = "italic" })
    highlight("String", { fg = palette.yellow })
    highlight("Keyword", { fg = palette.violet, style = "italic" })
    highlight("Constant", { fg = palette.purple })
    highlight("Function", { fg = palette.blue })
    highlight("Type", { fg = palette.link })
    highlight("StorageClass", { fg = palette.pink })
    highlight("Identifier", { fg = palette.foreground })
    highlight("Tag", { fg = palette.red })
    highlight("Attribute", { fg = palette.pink })
  else
    -- Regras para default, less_dark, minimalista, mono_accent
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
  end

  -- Diffs
  highlight("DiffAdd", { bg = "#74d2b720" })
  highlight("DiffChange", { bg = "#87bff720" })
  highlight("DiffDelete", { bg = "#bd427720" })
  highlight("DiffText", { bg = "#87bff740" })

  -- Links
  link("NonText", "Comment")
  link("Conceal", "Normal")
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

  local current_style = config.style
  local palette = palettes.get(current_style)

  -- Configura as cores do terminal
  if palette.ansi then
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
  end

  _apply_highlights(palette, current_style)
end

-- Função de setup para o usuário
local function setup(opts)
  if opts then
    config.style = opts.style or "default"
  end
  -- Recarrega o tema imediatamente após o setup
  load()
end

return {
  setup = setup,
  load = load,
}