vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use "neovim/nvim-lspconfig"

  use {
    'nvimtools/none-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'echasnovski/mini.pairs',
  }

  use { "L3MON4D3/LuaSnip", run = "make install_jsregexp" }
end)
