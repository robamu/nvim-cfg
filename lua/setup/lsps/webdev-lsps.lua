local generic_cfg = require("setup/lsps/generic")

require("lspconfig").eslint.setup({
  capabilities = generic_cfg.capabilities,
  on_attach = function(_, bufnr)
    generic_cfg.on_attach(_, bufnr)
  end,
})
