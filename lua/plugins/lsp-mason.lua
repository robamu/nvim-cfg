return {
  {
    "neovim/nvim-lspconfig",
    version = "2",
    dependencies = {
      "mason.nvim",
      { "mason-org/mason-lspconfig.nvim", config = function() end },
    },
    config = function()
      local generic_cfg = require("plugins/helpers/generic-lsp")
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          generic_cfg.on_attach(ev.data.id, ev.buf)
        end,
      })

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

      local clangd_config = vim.lsp.config["clangd"].on_attach
      vim.lsp.config("clangd", {
        capabilities = generic_cfg.capabilities,
        on_attach = function(client, bufnr)
          if (clangd_config ~= nil) then
            clangd_config(client, bufnr)
          end
          vim.keymap.set(
            "n",
            "<leader><tab>",
            "<Cmd>LspClangdSwitchSourceHeader<CR>",
            { desc = "Switch to source or header file" }
          )
        end,
      })
      vim.lsp.enable("clangd")

      vim.lsp.config("lua_ls", {})
      vim.lsp.enable("lua_ls")
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
