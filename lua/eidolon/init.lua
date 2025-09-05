local config = require("eidolon.config")
local palettes = require("eidolon.palettes")

local function highlight(group, colors)
  local val = {}
  if colors.fg then val.fg = colors.fg end
  if colors.bg then val.bg = colors.bg end
  if colors.sp then val.sp = colors.sp end
  if colors.style and colors.style ~= "NONE" then
    val.style = colors.style
  end
  vim.api.nvim_set_hl(0, group, val)
end

local function link(group, target)
  vim.api.nvim_set_hl(0, group, { link = target, default = true })
end

local function _apply_highlights(palette, style)

  highlight("Normal", { fg = palette.foreground, bg = palette.background })
  highlight("Cursor", { fg = palette.background, bg = palette.cursor })

  highlight("Comment", { fg = palette.comment, style = "NONE" })

end

local function load()



  local current_style = config.style
  local palette = palettes.get(current_style)


  if palette.ansi then
    vim.g.terminal_color_0 = palette.ansi.black
  
  end

  _apply_highlights(palette, current_style)
end

local function setup(opts)
  if opts then
    config.style = opts.style or "default"
  end
  load()
end

return {
  setup = setup,
  load = load,
}