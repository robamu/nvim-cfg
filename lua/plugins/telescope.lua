return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    -- See `:help telescope.builtin`
    keys = {
      {
        "<leader>?",
        "<cmd>Telescope oldfiles<cr>",
        { desc = "[?] Find recently opened files" },
      },
      {
        "<leader><space>",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
        { desc = "[ ] Find existing buffers" },
      },
      {
        "<leader>/",
        function()
          -- You can pass additional configuration to telescope to change theme, layout, etc.
          require("telescope.builtin").current_buffer_fuzzy_find(
            require("telescope.themes").get_dropdown({
              winblend = 10,
              previewer = false,
            })
          )
        end,
        { desc = "[/] Fuzzily search in current buffer" },
      },
      { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },
      {
        "<leader>sf",
        "<cmd>Telescope find_files<cr>",
        { desc = "[S]earch [F]iles" },
      },
      {
        "<leader>sh",
        "<cmd>Telescope help_tags<cr>",
        { desc = "[S]earch [H]elp" },
      },
      {
        "<leader>sg",
        require("telescope.builtin").live_grep,
        { desc = "[S]earch by [G]rep" },
      },
      {
        "<leader>sw",
        require("telescope.builtin").grep_string,
        { desc = "[S]earch current [W]ord" },
      },
      {
        "<leader>sd",
        require("telescope.builtin").diagnostics,
        { desc = "[S]earch [D]iagnostics" },
      },
    },
    setup = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
      })

      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
  },
}
