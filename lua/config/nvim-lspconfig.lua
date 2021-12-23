return function()
  require('lspconfig').tsserver.setup({})

  require('lspconfig').eslint.setup({})

  require('lspconfig').solargraph.setup({})

  require('lspconfig').sumneko_lua.setup({
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'use' },
        },
      },
    },
  })
end
