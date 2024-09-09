return {
  "nvim-tree/nvim-tree.lua",
  version = "1",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nt = require("nvim-tree")
    nt.setup({})

    local nt_api = require("nvim-tree.api")
    vim.keymap.set("n", "<leader>r", nt_api.tree.toggle, { desc = "Toggle T[r]ee" })
  end,
}
