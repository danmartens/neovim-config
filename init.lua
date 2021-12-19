vim.g.neon_style = 'dark'

vim.cmd([[
  colorscheme tokyonight

  set encoding=utf-8

  set mouse=a

  set relativenumber number

  set shiftwidth=2
  set tabstop=2
  set expandtab

  let mapleader=","

  if has("termguicolors")
    set termguicolors
  endif

  vnoremap > >gv
  vnoremap < <gv

  nnoremap <leader>pi :PackerInstall<cr>
  nnoremap <leader>ps :PackerSync<cr>

  nnoremap <leader>cs :so ~/.config/nvim/init.lua<cr>

  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <leader>fs <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
  nnoremap <leader>fd <cmd>Telescope lsp_definitions<cr>
  nnoremap <leader>fr <cmd>Telescope lsp_references<cr>

  nnoremap <silent><c-]> :BufferLineCycleNext<cr>
  nnoremap <silent><c-[> :BufferLineCyclePrev<cr>

  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup END
]])

require('packer').startup(function()
  use('wbthomason/packer.nvim')

  use('tpope/vim-sensible')
  use('tpope/vim-commentary')

  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      vim.api.nvim_command('TSUpdate')
    end,
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'maintained',
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  })

  use({
    'glepnir/indent-guides.nvim',
    config = function()
      require('indent_guides').setup({})
    end,
  })

  use('junegunn/rainbow_parentheses.vim')

  use('yamatsum/nvim-cursorline')

  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end,
  })

  -- use({
  --   'lewis6991/spellsitter.nvim',
  --   config = function()
  --     require('spellsitter').setup({
  --       enable = true,
  --       spellchecker = 'ffi',
  --     })
  --   end,
  -- })

  use('neovim/nvim-lspconfig')

  use({
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' },
  })

  use('tpope/vim-endwise')
  use('rstacruz/vim-closer')

  use('L3MON4D3/LuaSnip')

  use({
    'hrsh7th/nvim-cmp',
    config = function()
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
    end,
  })

  use('hrsh7th/cmp-nvim-lsp')
  use('saadparwaiz1/cmp_luasnip')

  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  })

  use({
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup({})
    end,
  })

  use('folke/tokyonight.nvim')
  use('rafamadriz/neon')

  use({
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({
        triggers = '<leader>',
      })
    end,
  })

  use({
    'sbdchd/neoformat',
    config = function()
      vim.cmd([[
        augroup fmt
          autocmd!
          autocmd BufWritePre * undojoin | Neoformat
        augroup END
      ]])
    end,
  })

  use({
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        diagnostics = 'nvim_lsp',
      })
    end,
  })

  use({
    'phaazon/hop.nvim',
    branch = 'v1',
    config = function()
      require('hop').setup({})
    end,
  })

  use({
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = require('config/gitsigns'),
  })
end)

require('lspconfig').tsserver.setup({})
require('lspconfig').eslint.setup({})
require('lspconfig').solargraph.setup({})

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