return {
  "nvim-tree/nvim-tree.lua",
  version = "1",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>r",
      "<cmd>NvimTreeToggle<cr>",
      { desc = "Toggle T[r]ee" },
    },
  },
  config = function()
    require("nvim-tree").setup()
  end,
}
