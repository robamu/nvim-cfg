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
      vim.lsp.enable("basedpyright")
      vim.lsp.config("ruff", {
        on_attach = function(client, bufnr)
          generic_cfg.on_attach(client, bufnr)
          client.server_capabilities.hoverProvider = false
        end,
      })
      vim.lsp.enable("ruff")

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
      vim.lsp.enable("clangd")
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "owallb/mason-auto-install.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      -- Optional: LSP configurations in `vim.lsp.config` needs to be loaded
      -- first to find associated filetypes automatically. If you use
      -- lspconfig for that, add it as a dependency.
      "neovim/nvim-lspconfig",
    },
    opts = {
      packages = {
        "lua-language-server",
        "stylua",
        "codelldb",
        "ruff",
        "basedpyright",
        "rust-analyzer",
      },
    },
  },
}
