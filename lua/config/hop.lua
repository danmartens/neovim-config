return function()
  require('hop').setup({})

  local keymap = require('keymap')

  keymap.n('mw', '<cmd>HopWord<cr>')
  keymap.n('ml', '<cmd>HopLine<cr>')
end
