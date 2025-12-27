-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- UI: Directory tree, folding, scrolling, terminal etc.
    { import = "plugins.ui" },

    -- Completion plugins.
    { import = "plugins.completion" },
    -- DAP, testing, formatting, coverage
    { import = "plugins.dap" },
    { import = "plugins.testing" },
    { import = "plugins.formatter" },
    { import = "plugins.coverage" },

    { import = "plugins.cosmetic" },
    -- { import = "plugins.lspkind" },

    -- Language specific plugins.
    { import = "plugins.lua" },
    { import = "plugins.rust" },
    { import = "plugins.python" },

    -- Others
    --{ import = "plugins.copilot" },
    { import = "plugins.windsurf" },
    { import = "plugins.telescope" },
    { import = "plugins.treesitter" },
    { import = "plugins.lsp-mason" },
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
