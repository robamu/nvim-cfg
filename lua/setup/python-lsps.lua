local generic_cfg = require("setup/generic-lspcfg")

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("lspconfig").pyright.setup({
  capabilities = capabilities,
   on_attach = function(_, bufnr)
     generic_cfg.on_attach(_, bufnr)
   end,
})

--require("lspconfig").pylsp.setup({
--  capabilities = capabilities,
--  on_attach = function(client, bufnr)
--    generic_cfg.on_attach(client, bufnr)
--  end,
--  settings = {
--    pylsp = {
--      plugins = {
--        pycodestyle = { enabled = false },
--        rope_autoimport = { enabled = true },
--        flake8 = { enabled = false },
--      },
--    },
--  },
--})

require("lspconfig").ruff_lsp.setup({
  on_attach = function(client, bufnr)
    generic_cfg.on_attach(client, bufnr)
    client.server_capabilities.hoverProvider = false
  end,
})
