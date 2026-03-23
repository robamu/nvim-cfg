return {
  "Exafunction/windsurf.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("codeium").setup({
      enable_cmp_source = false
    })
  end,
}
