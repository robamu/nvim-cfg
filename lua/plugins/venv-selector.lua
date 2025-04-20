return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  lazy = false,
  branch = "regexp", -- This is the regexp branch, use this for the new version
  ---@type venv-selector.Config
  opts = {
    -- Your settings go here
  },
}
