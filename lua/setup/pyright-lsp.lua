local generic_cfg = require("setup/generic-lspcfg")

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("lspconfig").pyright.setup {
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    generic_cfg.on_attach(_, bufnr)
  end
}

