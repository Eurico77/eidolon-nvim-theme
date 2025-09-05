# Eidolon for Neovim

![Eidolon Theme Preview](https://raw.githubusercontent.com/eurico/vscode-eidolon-theme/main/images/image.png)

A port of the beautiful Eidolon VS Code theme for Neovim, crafted with Lua. Now with all official variations!

## ✨ Features

*   Five styles to choose from: `default`, `alternativo`, `less_dark`, `minimalista`, `mono_accent`.
*   Dark, elegant, and modern color palettes.
*   Full support for common Neovim UI elements.
*   Basic support for syntax highlighting.
*   Terminal colors included.

## 📦 Installation

Install using your favorite plugin manager.

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "SEU_USUARIO/eidolon.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Choose a style (or leave empty for default)
    require("eidolon").setup({
      style = "default" -- Can be "alternativo", "less_dark", "minimalista", "mono_accent"
    })
  end,
}
```

**Important**: Don't forget to replace `SEU_USUARIO` with your actual GitHub username!

## 🚀 Usage & Configuration

The theme is configured and loaded through the `setup` function as shown above. You can change the `style` to any of the available options.

If you want to change styles on the fly, you can call the setup function again:

```lua
-- Change to the 'less_dark' style
require("eidolon").setup({ style = "less_dark" })
```

## 🎨 Customization

You can easily tweak the theme by editing the color values in `lua/eidolon/palettes.lua`.

---
*This theme was bootstrapped and refactored by Gemini.*