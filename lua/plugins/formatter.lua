return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { "rustfmt", lsp_format = "fallback" },
      -- Conform will run the first available formatter
      javascript = { "prettierd", "prettier", stop_after_first = true },
      c = { "clang-format" },
      cpp = { "clang-format" },
      json = { "prettier" },
    },
  },
}
-- return {
--   "mhartington/formatter.nvim",
--   config = function()
--     local fmt = require("formatter")
--     fmt.setup({
--       -- Enable or disable logging
--       logging = true,
--       -- Set the log level
--       log_level = vim.log.levels.WARN,
--       -- All formatter configurations are opt-in
--       filetype = {
--         -- Formatter configurations for filetype "lua" go here
--         -- and will be executed in order
--         lua = {
--           -- "formatter.filetypes.lua" defines default configurations for the
--           -- "lua" filetype
--           require("formatter.filetypes.lua").stylua,
--         },
--         python = {
--           require("formatter.filetypes.python").ruff,
--         },
--         rust = {
--           require("formatter.filetypes.rust").rustfmt,
--         },
--         cpp = {
--           require("formatter.filetypes.cpp").clangformat,
--         },
--         c = {
--           require("formatter.filetypes.cpp").clangformat,
--         },
--         typescript = {
--           require("formatter.filetypes.typescript").prettier,
--         },
--         typescriptreact = {
--           require("formatter.filetypes.typescriptreact").prettier,
--         },
--         javascript = {
--           require("formatter.filetypes.javascript").prettier,
--         },
--         json = {
--           require("formatter.filetypes.json").prettier,
--         },
--         toml = {
--           require("formatter.filetypes.toml").taplo,
--         },
--         html = {
--           require("formatter.filetypes.html").prettier,
--         },
--         css = {
--           require("formatter.filetypes.css").prettier,
--         },
--         scss = { require("formatter.filetypes.css").prettier },
--         xml = {
--           require("formatter.filetypes.xml").xmllint,
--         },
--         -- Use the special "*" filetype for defining formatter configurations on
--         -- any filetype
--         ["*"] = {
--           require("formatter.filetypes.any").remove_trailing_whitespace,
--         },
--       },
--     })
--
--     vim.keymap.set("n", "<Leader>f", ":Format<CR>", { desc = "[F]ormat buffer" })
--     vim.keymap.set(
--       "n",
--       "<Leader>F",
--       ":FormatWrite<CR>",
--       { desc = "[F]ormat buffer and write" }
--     )
--   end,
-- }
