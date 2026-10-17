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

You might have to re-start `neovim` multiple times on the first launch, though this should be a
fully self-installing setup in theory. Language servers, formatters and debuggers are installed
automatically with Mason.

Right now, this configuration has been used for work in:

- Rust
- Python
- Lua
- C/C++

It is recommended to install [ripgrep](https://github.com/BurntSushi/ripgrep) and
[fd](https://github.com/sharkdp/fd) for better telescope functionality.

# Additional steps

## tree-sitter CLI

The `main` branch of [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
requires the [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/tree/master/crates/cli)
and a C compiler to build the parsers.

```sh
cargo install --locked tree-sitter-cli
```

Alternatively, install it with `npm install -g tree-sitter-cli`.

## lazygit

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
uv tool install --upgrade pynvim
```

# Additional steps for HDL

Install these Mason packages for VHDL support:

```
:MasonInstall rust_hdl vsg verible
```

- `rust_hdl` provides the `vhdl_ls` language server.
- `vsg` is used as the VHDL formatter by conform.nvim.
- `verible` provides both the LSP and formatter for Verilog and SystemVerilog

`vhdl_ls` only starts if a `vhdl_ls.toml` exists in the project root. The library must not be
named `work`.

```toml
[libraries]
my_lib.files = ["src/*.vhd"]
```

# Most important custom keybindings and commands

- Leader key is remapped to `<Space>`.
- Exit terminal mode: `<Leader><Esc>`
- Open NVIM tree: `<Leader>r`
- Open `lazygit`: `<Leader>g`
- Format buffer using [conform.nvim](https://github.com/stevearc/conform.nvim): `<Leader>f`
- telescope search in buffers:  `<Leader><Leader>`
- telescope search in last files: `<Leader>?`
- Run nearest test: `<Leader>tr` or `:NtRun`
- Open and jump into test output: `<Leader>to` or `:NtOpen`
- Display test summary: `<Leader>ts` or `:NtSum`
- Debug nearest test: `<Leader>td` or `:NtDebug`
- Toggle breakpoint: `<Leader>dt` or `:DapToggleBreakpoint`
- Open Terminal in same window: `<Leader>tt`, then `i` to go into terminal mode.

# Configuring the theme

You can find all theme settings inside `lua/plugins/cosmetic.lua`. Currently,
[`catppuccin`](https://github.com/catppuccin/nvim) is used.
