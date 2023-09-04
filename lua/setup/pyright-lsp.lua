local generic_cfg = require("setup/generic-lspcfg")

require("lspconfig").pyright.setup {
  on_attach = function(_, bufnr)
    generic_cfg.on_attach(_, bufnr)
  end
}

