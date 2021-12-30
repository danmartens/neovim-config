return function()
  vim.cmd('let test#strategy = "neovim"')

  local keymap = require('keymap')

  keymap.n('<leader>t', '<cmd>TestNearest<cr>')
  keymap.n('<leader>T', '<cmd>TestFile<cr>')
end
