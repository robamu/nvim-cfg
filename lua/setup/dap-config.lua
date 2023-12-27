require("dapui").setup()
local dap, dapui = require("dap"), require("dapui")

dap.adapters.codelldb = require("setup/codelldb_cfg").codelldb

local mason_registry = require("mason-registry")
local cpptools = mason_registry.get_package("cpptools")
local extensions_path = cpptools:get_install_path() .. "/extension"
local cppdbg_cmd = extensions_path .. "/debugAdapters/bin/OpenDebugAD7"
dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = cppdbg_cmd
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.after.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.after.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
vim.keymap.set("n", "<Leader>di", ":DapStepInto<CR>")
vim.keymap.set("n", "<Leader>dc", function()
  require("dap").clear_breakpoints()
end)
vim.keymap.set("n", "<Leader>dl", function()
  require("dap").list_breakpoints(true)
end)
