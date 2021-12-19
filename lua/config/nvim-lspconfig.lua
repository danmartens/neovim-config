return function()
  require('lspconfig').tsserver.setup({})
  require('lspconfig').eslint.setup({})
  require('lspconfig').solargraph.setup({})
end
