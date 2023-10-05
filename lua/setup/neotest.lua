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
vim.api.nvim_create_user_command("NtFile",  function(_) nt.run.run(vim.fn.expand('%')) end, {
  desc = 'Run current [File] with [N]eo[t]est',
})
vim.api.nvim_create_user_command("NtSum", nt.summary.toggle, {
  desc = 'Toggle [N]eo[t]est Summary',
})
