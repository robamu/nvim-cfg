-- ensure the packer plugin manager is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Plugin list
require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
  })
  use({ "ellisonleao/gruvbox.nvim" })
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  })
  use({
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  })
  use({ "mhartington/formatter.nvim" })
  use({
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim", run = ":MasonUpdate" },
      "williamboman/mason-lspconfig.nvim",
      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use("karb94/neoscroll.nvim")
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-neotest/neotest-python",
      "rouge8/neotest-rust",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
  })
  use({
    "andythigpen/nvim-coverage",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = [[
      cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release &&
      cmake --install build --prefix build
    ]],
  })
  use({
    "andymass/vim-matchup",
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  })
  -- Autocompletion framework
  use("hrsh7th/nvim-cmp")
  use({
    -- cmp LSP completion
    "hrsh7th/cmp-nvim-lsp",
    -- cmp Snippet completion
    -- "hrsh7th/cmp-vsnip",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- cmp Path completion
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    after = { "hrsh7th/nvim-cmp" },
    requires = { "hrsh7th/nvim-cmp" },
  })
  -- See hrsh7th other plugins for more great completion sources!
  -- Snippet engine
  -- use('hrsh7th/vim-vsnip')
  -- Adds extra functionality over rust analyzer
  use("simrat39/rust-tools.nvim")
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  use("nvim-tree/nvim-web-devicons")
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("mfussenegger/nvim-dap-python")
  use("averms/black-nvim")
  use("linux-cultist/venv-selector.nvim")
end)

-- the first run will install packer and our plugins
if packer_bootstrap then
  require("packer").sync()
  return
end

require("setup")
