return {
  {
    "neovim/nvim-lspconfig",
    version = "2",
    dependencies = {
      "mason.nvim",
      { "mason-org/mason-lspconfig.nvim", config = function() end },
    },
    --opts = {
    --  setup = {
    --    -- Prevent configuration here, is done by rustaceanvim.
    --    rust_analyzer = function()
    --      return true
    --    end,
    --  },
    --},
    config = function()
      local generic_cfg = require("plugins/helpers/generic-lsp")

      -- lspconfig.pyright.setup({
      --   capabilities = generic_cfg.capabilities,
      --   on_attach = function(_, bufnr)
      --     generic_cfg.on_attach(_, bufnr)
      --   end,
      -- })

      vim.lsp.config("basedpyright", {
        on_attach = function(_, bufnr)
          generic_cfg.on_attach(_, bufnr)
        end,
        settings = {
          basedpyright = {
            analysis = {
              -- Problematic for some reason..
              reportMissingTypeStubs = false,
              typeCheckingMode = "basic",
            },
          },
        },
      })

      vim.lsp.config("clangd", {
        capabilities = generic_cfg.capabilities,
        on_attach = function(_, bufnr)
          generic_cfg.on_attach(_, bufnr)
          generic_cfg.nmap(
            "<leader><tab>",
            "<Cmd>ClangdSwitchSourceHeader<CR>",
            "Switch to source or header file"
          )
        end,
      })

      vim.lsp.config("ruff", {
        on_attach = function(client, bufnr)
          generic_cfg.on_attach(client, bufnr)
          client.server_capabilities.hoverProvider = false
        end,
      })
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "ruff", "basedpyright", "lua_ls" },
    },
  },
}
