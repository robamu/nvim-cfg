nvim configuration
========

Personal neovim configuration.

**Unix**

```sh
cd ~/.config
git clone git@github.com:robamu/nvim-cfg.git nvim
```

**Windows**

```ps
cd $HOME/AppData/Local
git clone git@github.com:robamu/nvim-cfg.git nvim
```

You might need to run `:MasonUpdate` and `:PackerInstall` again, even
though this should be a fully self-installing setup in theory.

Right now, this configuration has been used for work in:

- Rust
- Python
- Lua
- C/C++

It is recommended to install [ripgrep](https://github.com/BurntSushi/ripgrep) and
[fd](https://github.com/sharkdp/fd) for beter telescope functionality.

The [`black`](https://github.com/psf/black) Python auto-formatter and the
[`stylua`](https://github.com/JohnnyMorganz/StyLua) Lua auto-formatter will be installed
automatically if they are not detected on the system.

# Additional steps

Install [lazygit](https://github.com/jesseduffield/lazygit#ubuntu)

```sh
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

# Additional steps for Python

## `pynvim` installation

```sh
python3 -m pip install pynvim
```

# Most important custom keybindings and commands

- Leader key is remapped to `<Space>`.
- Exit terminal mode: `<Leader><Esc>`
- Open NVIM tree: `<Leader>r`
- Open `lazygit`: `<Leader>g`
- Auto-formatting using the [formatter plugin](https://github.com/mhartington/formatter.nvim):
  `<Leader>f` or `:Format`
- Auto-format and write: `<Leader>F` or `:FormatWrite`
- telescope search in buffers:  `<Leader><Leader>`
- telescope search in last files: `<Leader>?`
- Run nearest test: `<Leader>tr` or `:NtRun`
- Open and jump into test output: `<Leader>to` or `:NtShow`
- Display test summary: `<Leader>ts` or `:NtSum`
- Debug nearest test: `<Leader>td` or `:NtDebug`
- Open Terminal in same window: `<Leader>tt`, then `i` to go into terminal mode.

## Rust

# Configuring the theme

You can find all theme settings inside the `lua/setup/theme.lua` folder. Currently,
[`gruvbox`](https://github.com/ellisonleao/gruvbox.nvim) and
[`catppuccino`](https://github.com/catppuccin/nvim) are pre-installed.
