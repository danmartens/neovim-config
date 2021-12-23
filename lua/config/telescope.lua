return function()
  local keymap = require('keymap')

  keymap.n('<c-p>', '<cmd>Telescope find_files<cr>')

  keymap.n('<leader>ff', '<cmd>Telescope find_files<cr>')
  keymap.n('<leader>fg', '<cmd>Telescope live_grep<cr>')
  keymap.n('<leader>fb', '<cmd>Telescope buffers<cr>')
  keymap.n('<leader>fh', '<cmd>Telescope help_tags<cr>')
  keymap.n('<leader>fs', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>')
  keymap.n('<leader>fd', '<cmd>Telescope lsp_definitions<cr>')
  keymap.n('<leader>fr', '<cmd>Telescope lsp_references<cr>')
end
