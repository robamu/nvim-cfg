local nt = require("neotest")
nt.setup({
  adapters = {
    require("neotest-python"),
    require("neotest-rust"),
  },
})

local run_desc = { desc = "[Run] nearest Test with [N]eo[t]est" }
local debug_desc = {
  desc = "[Debug] nearest Test with [N]eo[t]est",
}
local open_desc = {
  desc = "[Show] and enter Output for [N]eo[t]est",
}
local debug_func = function(_)
  nt.run.run({ strategy = "dap" })
end
local open_func = function(_)
  nt.output.open({ enter = true })
end
local toggle_panel_desc = {
  desc = "Open [Out]put [Panel] for [N]eo[t]est",
}
local run_file_func = function(_)
  nt.run.run(vim.fn.expand("%"))
end
local run_file_desc = {
  desc = "Run current [File] with [N]eo[t]est",
}
local summary_desc = {
  desc = "Toggle [N]eo[t]est Summary",
}

vim.api.nvim_create_user_command("NtRun", nt.run.run, run_desc)
vim.api.nvim_create_user_command("NtDebug", debug_func, debug_desc)
vim.api.nvim_create_user_command("NtOpen", open_func, open_desc)
vim.api.nvim_create_user_command("NtPanel", nt.output_panel.toggle, toggle_panel_desc)
vim.api.nvim_create_user_command("NtFile", run_file_func, run_file_desc)
vim.api.nvim_create_user_command("NtSum", nt.summary.toggle, summary_desc)

vim.keymap.set("n", "<Leader>tr", nt.run.run, run_desc)
vim.keymap.set("n", "<Leader>td", debug_func, run_desc)
vim.keymap.set("n", "<Leader>to", open_func, open_desc)
vim.keymap.set("n", "<Leader>tp", nt.output_panel.toggle, toggle_panel_desc)
vim.keymap.set("n", "<Leader>tf", run_file_func, run_file_desc)
vim.keymap.set("n", "<Leader>ts", nt.summary.toggle, summary_desc)
