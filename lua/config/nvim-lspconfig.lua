return function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  require('lspconfig').tsserver.setup({
    capabilities = capabilities,
    on_attach = function(client)
      require('illuminate').on_attach(client)
    end,
  })

  -- require('lspconfig').eslint.setup({})

  require('lspconfig').solargraph.setup({
    capabilities = capabilities,
    on_attach = function(client)
      require('illuminate').on_attach(client)
    end,
  })

  require('lspconfig').sumneko_lua.setup({
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'use' },
        },
      },
    },
    capabilities = capabilities,
    on_attach = function(client)
      require('illuminate').on_attach(client)
    end,
  })

  require('lspconfig').pyright.setup({
    capabilities = capabilities,
    on_attach = function(client)
      require('illuminate').on_attach(client)
    end,
  })
end
