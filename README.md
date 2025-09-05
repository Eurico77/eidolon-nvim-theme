# Eidolon for Neovim

![Eidolon Theme Preview](https://raw.githubusercontent.com/eurico/vscode-eidolon-theme/main/images/image.png)

A port of the beautiful Eidolon VS Code theme for Neovim, crafted with Lua.

## ✨ Features

- Dark, elegant, and modern color palette.
- Full support for common Neovim UI elements.
- Basic support for syntax highlighting.
- Terminal colors included.

## 📦 Installation

Install using your favorite plugin manager.

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "Eurico77/eidolon.nvim",
  lazy = false,
  priority = 1000, -- Make sure to load this before all the other start plugins
  config = function()
    -- Load the colorscheme here
    vim.cmd.colorscheme "eidolon"
  end,
}
```

**Important**: Don't forget to replace `SEU_USUARIO` with your actual GitHub username!

## 🚀 Usage

Once installed, you can set the colorscheme anytime by using the command:

```vim
:colorscheme eidolon
```

## 🎨 Customization

You can easily tweak the theme by editing the color values in `lua/eidolon/palette.lua`.

---

_This theme was bootstrapped by Gemini._

