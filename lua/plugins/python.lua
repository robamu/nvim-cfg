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
  keys = {
    { ",v", "<cmd>VenvSelect<cr>" },
  },
  ---@type venv-selector.Config
  opts = {
    -- Your settings go here
  },
  {
    "mfussenegger/nvim-dap-python",
    commit = "bfe572e4458e0ac876b9539a1e9f301c72db8ea0",
    config = function()
      require("dap-python").setup("uv")
    end,
  },
}
