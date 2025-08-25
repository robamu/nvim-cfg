return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
    lazy = true,
    config = function()
      local nt = require("neotest")
      nt.setup({
        adapters = {
          require("neotest-python"),
          require("rustaceanvim.neotest"),
          -- require("neotest-rust"),
        },
      })

      vim.api.nvim_create_user_command(
        "NtRun",
        nt.run.run,
        { desc = "[Run] nearest Test with [N]eo[t]est" }
      )
      vim.api.nvim_create_user_command("NtDebug", function()
        nt.run.run({ strategy = "dap" })
      end, { desc = "[Debug] nearest Test with [N]eo[t]est" })
      vim.api.nvim_create_user_command("NtOpen", function()
        nt.output.open({ enter = true })
      end, { desc = "Open [Out]put [Panel] for [N]eo[t]est" })
      vim.api.nvim_create_user_command(
        "NtPanel",
        nt.output_panel.toggle,
        { desc = "Open [Out]put [Panel] for [N]eo[t]est" }
      )
      vim.api.nvim_create_user_command("NtFile", function()
        nt.run.run(vim.fn.expand("%"))
      end, { desc = "Run current [File] with [N]eo[t]est" })
      vim.api.nvim_create_user_command(
        "NtSum",
        nt.summary.toggle,
        { desc = "Toggle [N]eo[t]est Summary" }
      )
    end,
    keys = {
      {
        "<Leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "[Run] nearest Test with [N]eo[t]est",
      },
      {
        "<Leader>td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "[Debug] nearest Test with [N]eo[t]est",
      },
      {
        "<Leader>to",
        function()
          require("neotest").output.open({ enter = true })
        end,
        desc = "[Show] and enter Output for [N]eo[t]est",
      },
      {
        "<Leader>tp",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Open [Out]put [Panel] for [N]eo[t]est",
      },
      {
        "<Leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run current [File] with [N]eo[t]est",
      },
      {
        "<Leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle [N]eo[t]est Summary",
      },
    },
  },

  {
    "nvim-neotest/neotest-python",
    ft = { "py", "python" },
    dependencies = {
      "nvim-neotest/neotest",
    },
  },
}
