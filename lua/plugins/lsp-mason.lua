return {
  {
    "neovim/nvim-lspconfig",
    version = "2",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local generic_cfg = require("plugins/helpers/generic-lsp")
      local lspconfig = require("lspconfig")

      lspconfig.pyright.setup({
        capabilities = generic_cfg.capabilities,
        on_attach = function(_, bufnr)
          generic_cfg.on_attach(_, bufnr)
        end,
      })

      lspconfig.basedpyright.setup({
        on_attach = function(_, bufnr)
          generic_cfg.on_attach(_, bufnr)
        end,
      })

      lspconfig.clangd.setup({
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

      lspconfig.ruff.setup({
        on_attach = function(client, bufnr)
          generic_cfg.on_attach(client, bufnr)
          client.server_capabilities.hoverProvider = false
        end,
      })
    end,
  },
  {
    "mason-org/mason.nvim",
    version = "2",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "rust_analyzer", "ruff", "basedpyright", "lua_ls" },
      })
    end,
  },
}
