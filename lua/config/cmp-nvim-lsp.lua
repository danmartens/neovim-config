return function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  require('lspconfig').tsserver.setup({
    capabilities = capabilities,
  })

  require('lspconfig').eslint.setup({
    capabilities = capabilities,
  })

  require('lspconfig').solargraph.setup({
    capabilities = capabilities,
  })
end
