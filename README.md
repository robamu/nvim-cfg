nvim configuration
========

Personal neovim configuration.

```sh
cd ~/.config
git clone git@github.com:robamu/nvim-cfg.git nvim
```

You might need to run `:MasonUpdate` and `PackerInstall` again, even
though this should be a fully self-installing setup in theory.

Right now, this configuration has been used for work in:

- Rust
- Python

It is recommended to install [ripgrep](https://github.com/BurntSushi/ripgrep) and
[fd](https://github.com/sharkdp/fd) for beter telescope functionality.

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

# Most important custom keybindings

1. Leader key is remapped to `<Space>`.
2. Open Terminal in same window: `<Leader>t`, then `i` to go into terminal mode.
3. Exit terminal mode: `<Leader><Esc>`
4. Open NVIM tree: `<Leader>r`
5. Open `lazygit`: `<Leader>g`
6. Auto-formatting:  `<Leader>f`
7. telescope search in buffers:  `<Leader><Leader>`
8. telescope search in last files: `<Leader>?`

## Rust
