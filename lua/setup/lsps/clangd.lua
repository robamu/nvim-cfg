local generic_cfg = require("setup/lsps/generic")

require("lspconfig").clangd.setup({
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
