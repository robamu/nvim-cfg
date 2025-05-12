return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<Leader>dt", ":DapToggleBreakpoint<CR>" },
      { "<Leader>dx", ":DapTerminate<CR>" },
      { "<Leader>do", ":DapStepOver<CR>" },
      { "<Leader>di", ":DapStepInto<CR>" },
      {
        "<Leader>dc",
        function()
          require("dap").clear_breakpoints()
        end,
      },
      {
        "<Leader>dl",
        function()
          require("dap").list_breakpoints(true)
        end,
      },
    },
    config = function()
      require("dapui").setup()
      local dap, dapui = require("dap"), require("dapui")

      -- Use lldb installed by mason. Run MasonInstall codelldb manually.
      -- dap.adapters.codelldb = require("setup/codelldb_cfg").codelldb

      -- local mason_registry = require("mason-registry")
      -- local cpptools = mason_registry.get_package("cpptools")
      -- local extensions_path = cpptools:get_install_path() .. "/extension"
      -- local cppdbg_cmd = extensions_path .. "$MASON/share/cpptools/extension/debugAdapters/bin/OpenDebugAD7"
      -- dap.adapters.cppdbg = {
        -- id = "cppdbg",
        -- type = "executable",
        -- command = cppdbg_cmd,
      -- }

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.after.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.after.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("~/.virtualenv/bin/python3")
    end,
  },
}
