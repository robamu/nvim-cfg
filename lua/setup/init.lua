require("setup/theme")
-- neodev must come before the LSP configuration
--
-- The generic mason LSP config must come before all other individual LSP configs.
require("setup/lsps")

require("setup/python-dap")
require("setup/venv-select")
require("setup/autopairs")
require("setup/nvim-cmp")
require("setup/telescope")
require("setup/treesitter")
require("setup/dap-config")
require("setup/web-devicons")
require("setup/lualine")
require("setup/toggleterm")
require("setup/nvim-tree")
require("setup/neotest")
require("setup/neoscroll")
require("setup/formatter")
require("setup/coverage")
require("setup/litree")
