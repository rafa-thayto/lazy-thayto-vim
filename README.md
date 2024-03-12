# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Make a backup of your current Neovim files:

**Linux/Mac OS:**

```sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

**Windows:**

```sh
mv $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
mv $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

## Clone the starter

**Linux/Mac OS**

```sh
git clone https://github.com/rafa-thayto/lazy-thayto-vim ~/.config/nvim
```

**Windows:**

```sh
git clone https://github.com/rafa-thayto/lazy-thayto-vim $env:LOCALAPPDATA\nvim
```

## ⚡️ Requirements

- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/)(v3.0 or greater) **_(optional, but needed to display some icons)_**
- [lazygit](https://github.com/jesseduffield/lazygit)
- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) **_(optional)_**
  - **live grep**: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - **find files**: [fd](https://github.com/sharkdp/fd)
  - better fuzzy finder: [fzf](https://github.com/junegunn/fzf)
  - json processor: [jq](https://github.com/jqlang/jq)
- a terminal that support true color and _undercurl_:
  - [kitty](https://github.com/kovidgoyal/kitty) **_(Linux & Macos)_**
  - [wezterm](https://github.com/wez/wezterm) **_(Linux, Macos & Windows)_**
  - [alacritty](https://github.com/alacritty/alacritty) **_(Linux, Macos & Windows)_**
  - [iterm2](https://iterm2.com/) **_(Macos)_**
