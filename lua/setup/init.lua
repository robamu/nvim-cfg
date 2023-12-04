-- Optical plugins
require("setup/theme")
require("setup/lualine")
require("setup/web-devicons")

-- neodev must come before the LSP configuration.
require("setup/neodev")
require("setup/lsps")

-- Debugging
require("setup/dap-config")
require("setup/python-dap")

require("setup/venv-select")
require("setup/telescope")
require("setup/treesitter")
require("setup/toggleterm")
require("setup/nvim-tree")
require("setup/neotest")
require("setup/neoscroll")
require("setup/formatter")
require("setup/coverage")
require("setup/litree")
require("setup/folding")

-- Completion plugins
require("setup/autopairs")
require("setup/copilot")
require("setup/nvim-cmp")
