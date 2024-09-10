return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local generic_cfg = require("plugins/helpers/generic-lsp")

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers

      require("lspconfig").pyright.setup({
        capabilities = generic_cfg.capabilities,
        on_attach = function(_, bufnr)
          generic_cfg.on_attach(_, bufnr)
        end,
      })

      --require("lspconfig").pylsp.setup({
      --  capabilities = capabilities,
      --  on_attach = function(client, bufnr)
      --    generic_cfg.on_attach(client, bufnr)
      --  end,
      --  settings = {
      --    pylsp = {
      --      plugins = {
      --        pycodestyle = { enabled = false },
      --        rope_autoimport = { enabled = true },
      --        flake8 = { enabled = false },
      --      },
      --    },
      --  },
      --})

      require("lspconfig").ruff_lsp.setup({
        on_attach = function(client, bufnr)
          generic_cfg.on_attach(client, bufnr)
          client.server_capabilities.hoverProvider = false
        end,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
    end,
  },
}
