return function()
  local cmp = require('cmp')

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    sources = {
      { name = 'luasnip' },
      { name = 'nvim_lsp' },
    },
    mapping = {
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
  })
end
