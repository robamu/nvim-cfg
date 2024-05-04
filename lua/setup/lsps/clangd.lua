local generic_cfg = require("setup/lsps/generic")

require("lspconfig").clangd.setup({
  capabilities = generic_cfg.capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    '--query-driver="/home/rmueller/.local/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/10.3.1-2.3.1/.content/bin/arm-none-eabi*"',
  },
  on_attach = function(_, bufnr)
    generic_cfg.on_attach(_, bufnr)
    generic_cfg.nmap(
      "<leader><tab>",
      "<Cmd>ClangdSwitchSourceHeader<CR>",
      "Switch to source or header file"
    )
  end,
})
