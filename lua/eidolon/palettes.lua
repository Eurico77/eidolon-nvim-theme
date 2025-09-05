-- eidolon.nvim/lua/eidolon/palettes.lua

local M = {}

-- Paleta Padrão (extraída de eidolon-color-theme.json)
M.default = {
  background = "#12121f",
  foreground = "#daddff",
  selection = "#29293f",
  comment = "#63658b",
  link = "#94aef9",
  cursor = "#88a4f7",
  red = "#bd4277",
  green = "#74d2b7",
  yellow = "#e5dca4",
  blue = "#87bff7",
  purple = "#9486e4",
  violet = "#9f95e9",
  cyan = "#9be9f8",
  pink = "#c45a99",
  ui_background = "#1d1d2f",
  ui_foreground = "#d0d3ff",
  ui_border = "#222236",
  ui_highlight = "#171728",
}

-- Paleta Alternativa (extraída de eidolon-alternativo-theme.json)
M.alternativo = {
  background = "#12121f",
  foreground = "#daddff",
  selection = "#29293f",
  comment = "#63658b",
  link = "#94aef9",
  cursor = "#88a4f7",
  red = "#bd4277",
  green = "#74d2b7",
  yellow = "#e5dca4",
  blue = "#87bff7",
  purple = "#9486e4",
  violet = "#9f95e9",
  cyan = "#9be9f8",
  pink = "#c45a99",
  orange = "#e2b88d", -- Cor extra para esta variação
  ui_background = "#1d1d2f",
  ui_foreground = "#d0d3ff",
  ui_border = "#222236",
  ui_highlight = "#171728",
}

-- Paleta Less Dark (extraída de eidolon-less-dark-theme.json)
M.less_dark = {
  background = "#1d1d2f", -- Mais claro
  foreground = "#daddff",
  selection = "#29293f",
  comment = "#63658b",
  link = "#94aef9",
  cursor = "#88a4f7",
  red = "#bd4277",
  green = "#74d2b7",
  yellow = "#e5dca4",
  blue = "#87bff7",
  purple = "#9486e4",
  violet = "#9f95e9",
  cyan = "#9be9f8",
  pink = "#c45a99",
  ui_background = "#171728",
  ui_foreground = "#d0d3ff",
  ui_border = "#222236",
  ui_highlight = "#222236", -- Mais claro
}

-- Paleta Minimalista (extraída de eidolon-minimalista-theme.json)
M.minimalista = {
  background = "#12121f",
  foreground = "#daddff",
  selection = "#29293f",
  comment = "#63658b",
  link = "#94aef9",
  cursor = "#88a4f7",
  red = "#bd4277",
  green = "#74d2b7",
  yellow = "#e5dca4",
  blue = "#87bff7",
  purple = "#9f95e9", -- Diferente do JSON, mas consistente
  violet = "#9f95e9",
  cyan = "#88a4f7", -- Diferente do JSON
  pink = "#9f95e9", -- Diferente do JSON
  ui_background = "#171728",
  ui_foreground = "#d0d3ff",
  ui_border = "#12121f", -- Sem bordas
  ui_highlight = "#171728",
}

-- Paleta Mono Accent (extraída de eidolon-mono-accent-theme.json)
M.mono_accent = {
  background = "#12121f",
  foreground = "#daddff",
  selection = "#29293f",
  comment = "#63658b",
  link = "#9486e4", -- Usando o acento principal
  cursor = "#9486e4",
  red = "#9486e4",
  green = "#9f95e9",
  yellow = "#d0d3ff",
  blue = "#9486e4",
  purple = "#9f95e9",
  violet = "#9486e4",
  cyan = "#daddff",
  pink = "#9f95e9",
  ui_background = "#1d1d2f",
  ui_foreground = "#d0d3ff",
  ui_border = "#222236",
  ui_highlight = "#171728",
}

-- Função para obter a paleta desejada
function M.get(name)
  return M[name] or M.default
end

return M
