local generic_lsg_cfg = require("setup/generic-lspcfg")

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  lua_ls = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}


-- Plugin setup
require('mason').setup {}

-- Ensure the servers above are installed
local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = { "lua_ls", "pyright", "ruff_lsp", "rust_analyzer", },
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = generic_lsg_cfg.on_attach,
      settings = servers[server_name],
    }
 end,
}