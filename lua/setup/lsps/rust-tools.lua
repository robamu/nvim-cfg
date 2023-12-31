local generic_cfg = require("setup/lsps/generic")
local rt = require("rust-tools")
local codelldb_cfg = require("setup/codelldb_cfg").codelldb

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
rt.setup({
  runnables = {
    use_telescope = true,
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = function(_, bufnr)
      generic_cfg.on_attach(_, bufnr)
      generic_cfg.nmap("<Leader>k", rt.hover_actions.hover_actions, "Hover actions")
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

  -- We already set this up for codelldb.. but I guess this is still necessary to make commands
  -- like :RustDebuggables work?
  dap = {
    adapter = codelldb_cfg,
  },
})

-- Only load this if .vscode/launch.json exists?
-- Not fully happy with this yet..
-- require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {'c', 'cpp', 'rust'} })
