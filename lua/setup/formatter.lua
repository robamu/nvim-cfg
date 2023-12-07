local fmt = require("formatter")
fmt.setup({
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,
    },
    python = {
      require("formatter.filetypes.python").black,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
    cpp = {
      require("formatter.filetypes.cpp").clangformat,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    html = {
      require("formatter.filetypes.html").prettier,
    },
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})

vim.keymap.set("n", "<Leader>f", ":Format<CR>", { desc = "[F]ormat buffer" })
vim.keymap.set(
  "n",
  "<Leader>F",
  ":FormatWrite<CR>",
  { desc = "[F]ormat buffer and write" }
)
