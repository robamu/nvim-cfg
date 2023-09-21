local tt = require("toggleterm")
tt.setup {}

vim.keymap.set('n', '<leader>tt', tt.toggle_command, { desc = "[T]oggle [T]erminal"})
vim.keymap.set('t', '<leader><esc>', [[<C-\><C-n>]], { desc = "Exit terminal"})
