local function on_attach(client, buffer)
  -- local keymap_opts = { buffer = buffer }
  -- Get signatures (and _only_ signatures) when in argument lists.
  -- require "lsp_signature".on_attach({
    --doc_lines = 0,
   -- handler_opts = {
    --  border = "none"
    --},
  --})
end

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local opts = {
  runnables = {
    use_telescope = true,
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
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

require("rust-tools").setup(opts)

