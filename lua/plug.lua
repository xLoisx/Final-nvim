local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Use the Plug function to specify your plugins
-- Plug ('bluz71/vim-nightfly-colors', { as = 'nightfly' })

Plug('folke/tokyonight.nvim')
-- Plug('0xstepit/flow.nvim')

Plug('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

Plug 'nvim-lua/plenary.nvim'

Plug('nvim-telescope/telescope.nvim', { tag = '0.1.3' })

Plug('nvim-telescope/telescope-fzf-native.nvim', { module = 'telescope._extensions.fzf' })

-- Plug 'github/copilot.vim'
Plug 'mbbill/undotree'
Plug 'echasnovski/mini.pairs'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
-- Plug 'hrsh7th/vim-vsnip'
Plug "rafamadriz/friendly-snippets"
Plug('L3MON4D3/LuaSnip', { tag = 'v2.*', run = 'make install_jsregexp' })
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

-- Plug 'zivyangll/git-blame.vim'

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-repeat'

Plug 'psliwka/vim-smoothie'

Plug('mg979/vim-visual-multi', { branch = 'master' })

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'numToStr/Comment.nvim'

Plug 'nvim-tree/nvim-web-devicons'

Plug('akinsho/bufferline.nvim', { tag = '*' })

Plug 'nvim-tree/nvim-tree.lua'

Plug "petertriho/nvim-scrollbar"

Plug 'nvim-lualine/lualine.nvim'

vim.call('plug#end')
