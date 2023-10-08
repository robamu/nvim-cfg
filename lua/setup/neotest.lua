local nt = require("neotest")
nt.setup({
  adapters = {
    require("neotest-python"),
    require("neotest-rust")
  },
})

vim.api.nvim_create_user_command("NtRun", nt.run.run, {
  desc = '[Run] nearest Test with [N]eo[t]est',
})
vim.api.nvim_create_user_command("NtShow", function(_) nt.output.open({ enter = true }) end, {
  desc = '[Show] and enter Output for [N]eo[t]est'
})
vim.api.nvim_create_user_command("NtOutPanel", nt.output_panel.toggle, {
  desc = 'Open [Out]put [Panel] for [N]eo[t]est'
})
vim.api.nvim_create_user_command("NtFile", function(_) nt.run.run(vim.fn.expand('%')) end, {
  desc = 'Run current [File] with [N]eo[t]est',
})
vim.api.nvim_create_user_command("NtSum", nt.summary.toggle, {
  desc = 'Toggle [N]eo[t]est Summary',
})
