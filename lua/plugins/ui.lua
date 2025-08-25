return {
  -- Directory tree.
  {
    "nvim-tree/nvim-tree.lua",
    version = "1",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>r",
        "<cmd>NvimTreeToggle<cr>",
        { desc = "Toggle T[r]ee" },
      },
    },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Cleaner scrolling
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },

  -- Folding.
  {
    "kevinhwang91/nvim-ufo",
    version = "1",
    lazy = false,
    dependencies = "kevinhwang91/promise-async",
    config = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

      -- For some reasohn, the LSP way does not work..
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },

  -- Built-in terminal
  {
    "akinsho/toggleterm.nvim",
    config = function()
      local tt = require("toggleterm")
      tt.setup({})

      vim.keymap.set(
        "n",
        "<leader>tt",
        tt.toggle_command,
        { desc = "[T]oggle [T]erminal" }
      )
      vim.keymap.set("t", "<leader><esc>", [[<C-\><C-n>]], { desc = "Exit terminal" })

      local Terminal = require("toggleterm.terminal").Terminal

      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "double",
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(
            term.bufnr,
            "n",
            "q",
            "<cmd>close<CR>",
            { noremap = true, silent = true }
          )
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap(
        "n",
        "<leader>g",
        "<cmd>lua _lazygit_toggle()<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
