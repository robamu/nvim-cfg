return {
  -- LSP for Cargo.toml
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      completion = {
        crates = {
          enabled = true,
        },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
    init = function()
      vim.g.rustaceanvim = {
        server = {
          -- on_attach is a callback called when the language server attachs to the buffer
          on_attach = function(_, bufnr)
            local generic_cfg = require("plugins/helpers/generic-lsp")
            generic_cfg.on_attach(_, bufnr)
            -- Should work according to https://github.com/mrcjkb/rustaceanvim
            generic_cfg.nmap("<Leader>k", vim.lsp.buf.hover, "Hover actions")
          end,
          default_settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = {
                  enable = true,
                },
              },
              -- enable clippy on save
              checkOnSave = true,
              -- Enable diagnostics if using rust-analyzer
              diagnostics = {
                enable = true,
              },
              files = {
                excludeDirs = {
                  ".direnv",
                  ".git",
                  ".github",
                  ".gitlab",
                  "bin",
                  "node_modules",
                  "target",
                  "venv",
                  ".venv",
                },
              },
            },
          },
        },
      }
    end,
  },
}
