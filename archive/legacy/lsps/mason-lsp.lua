local generic_cfg = require("setup/lsps/generic")

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  lua_ls = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Plugin setup
require("mason").setup({})

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

local ensure_installed = {
  "lua_ls",
  "pyright",
  "ruff_lsp",
  "rust_analyzer",
  "clangd",
  "eslint",
  -- Not supported for auto-installation yet..
  -- "prettierd",
  -- "eslint_d",
}
-- Only install these if they are not found in $PATH
if vim.fn.executable("stylua") == 0 then
  table.insert(ensure_installed, "stylua")
end
-- if vim.fn.executable("black") == 0 then
  -- table.insert(ensure_installed, "black")
-- end

mason_lspconfig.setup({
  ensure_installed = ensure_installed,
})

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = generic_cfg.capabilities,
      on_attach = generic_cfg.on_attach,
      settings = servers[server_name],
    })
  end,
})
