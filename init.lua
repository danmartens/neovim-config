local keymap = require('keymap')

keymap.n('<c-p>', ':Telescope find_files<cr>')

keymap.n('K', '<cmd>lua vim.lsp.buf.hover()<cr>')

keymap.n('<c-h>', '<c-w>h')
keymap.n('<c-j>', '<c-w>j')
keymap.n('<c-k>', '<c-w>k')
keymap.n('<c-l>', '<c-w>l')

keymap.n('<c-q>', ':q<cr>')

-- Save
keymap.n('<c-s>', '<cmd>w<cr>')
keymap.i('<c-s>', '<esc><cmd>w<cr>')

-- Undo
keymap.n('<c-z>', 'u')
keymap.i('<c-z>', '<esc>u')

-- Reselect text after indent / dedent
keymap.v('>', '>gv')
keymap.v('<', '<gv')

-- Packer

keymap.n('<leader>pi', '<cmd>PackerInstall<cr>')
keymap.n('<leader>pu', '<cmd>PackerUpdate<cr>')
keymap.n('<leader>ps', '<cmd>PackerSync<cr>')

keymap.n('<leader>ce', '<cmd>e ~/.config/nvim/init.lua<cr>')

vim.cmd([[
  set encoding=utf-8

  set timeoutlen=1000 ttimeoutlen=0

  set title
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

  set mouse=a

  set relativenumber number

  set shiftwidth=2
  set tabstop=2
  set expandtab

  let mapleader=","

  if has("termguicolors")
    set termguicolors
  endif

  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup END

  augroup post_write
    autocmd!
    au BufWritePost * silent! lua vim.notify("\"" .. vim.fn.expand("%:t") .. "\" saved", "info", { timeout = 250 })
  augroup END

  augroup post_write_config
    autocmd!
    au BufWritePost init.lua silent! try | source ~/.config/nvim/init.lua | catch | lua vim.notify("Failed to source configuration!", "error") | endtry
  augroup END

  set guifont=FiraCode\ Nerd\ Font:h16
]])

require('packer').startup(function()
  use('wbthomason/packer.nvim')

  use('tpope/vim-sensible')

  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      vim.api.nvim_command('TSUpdate')
    end,
    config = require('config.nvim-treesitter'),
  })

  -- use({
  --   'nvim-treesitter/playground',
  --   requires = 'nvim-treesitter/nvim-treesitter',
  -- })

  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  })

  use({ 'p00f/nvim-ts-rainbow' })

  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        char = '┊',
        show_current_context = true,
        show_current_context_start = true,
      })
    end,
  })

  -- use('yamatsum/nvim-cursorline')

  use({
    'SmiteshP/nvim-gps',
    requires = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-gps').setup({})
    end,
  })

  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    after = 'nvim-gps',
    config = require('config.lualine'),
  })

  use({ 'neovim/nvim-lspconfig', config = require('config.nvim-lspconfig') })

  use({
    'RRethy/vim-illuminate',
    requires = 'nvim-lspconfig',
  })

  use({
    'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = require('config.renamer'),
  })

  use({
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' },
    config = require('config.telescope'),
  })

  use('L3MON4D3/LuaSnip')

  use('hrsh7th/cmp-path')

  use({
    'hrsh7th/nvim-cmp',
    config = require('config.nvim-cmp'),
  })

  use({ 'hrsh7th/cmp-nvim-lsp', config = require('config.cmp-nvim-lsp') })

  use('saadparwaiz1/cmp_luasnip')

  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({})
    end,
  })

  use('folke/tokyonight.nvim')

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end,
  })

  use({
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({
        triggers = '<leader>',
      })
    end,
  })

  use({
    'folke/lsp-colors.nvim',
    config = function()
      require('lsp-colors').setup({})
    end,
  })

  use({
    'sbdchd/neoformat',
    config = function()
      vim.cmd([[
        augroup fmt
          autocmd!
          autocmd BufWritePre * try | undojoin | Neoformat | catch /E790/ | finally | silent Neoformat | endtry
        augroup END
      ]])
    end,
  })

  use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup({})
    end,
  })

  use({
    'phaazon/hop.nvim',
    branch = 'v1',
    config = require('config.hop'),
  })

  use({
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = require('config.gitsigns'),
  })

  use({
    'folke/lua-dev.nvim',
    config = require('config.lua-dev'),
  })

  use({
    'vim-test/vim-test',
    config = function()
      vim.cmd('let test#strategy = "neovim"')
    end,
  })

  use({
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end,
  })

  use({ 'rktjmp/lush.nvim' })

  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  })
end)

vim.notify('Configuration sourced!', 'info', { timeout = 250 })
