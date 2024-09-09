return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false, -- This plugin is already lazy
  init = function()
    local generic_cfg = require("plugins/helpers//generic-lsp")
    vim.g.rustaceanvim = {
      -- all the opts to send to nvim-lspconfig
      -- these override the defaults set by rust-tools.nvim
      -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
      server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        on_attach = function(_, bufnr)
          generic_cfg.on_attach(_, bufnr)
          -- Should work according to https://github.com/mrcjkb/rustaceanvim
          generic_cfg.nmap("<Leader>k", vim.lsp.buf.hover, "Hover actions")
        end,
        settings = {
          -- to enable rust-analyzer settings visit:
          -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
          ["rust-analyzer"] = {
            -- enable clippy on save
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    }
  end,
}
