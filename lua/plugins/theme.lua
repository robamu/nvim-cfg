return {
  {
    "catppuccin/nvim",
    version = "1",
    name = "catppuccin",
    config = function()
      local none = {}
      local mocha_pink = {
        mocha = {
          text = "#F4CDE9",
          subtext1 = "#DEBAD4",
          subtext0 = "#C8A6BE",
          overlay2 = "#B293A8",
          overlay1 = "#9C7F92",
          overlay0 = "#866C7D",
          surface2 = "#705867",
          surface1 = "#5A4551",
          surface0 = "#44313B",

          base = "#352939",
          mantle = "#211924",
          crust = "#1a1016",
        },
      }

      require("catppuccin").setup({
        flavour = "frappe", -- mocha, latte, macchiato, frappe
        color_overrides = none, -- mocha_pink
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
  -- gruvbox is a nice alternative, but I prefer catppuccin
  {
    "ellisonleao/gruvbox.nvim", 
    priority = 1000,
    config = true,
    enabled = false,
    config = function()
      require("gruvbox").setup()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
