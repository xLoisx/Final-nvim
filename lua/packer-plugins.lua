vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use "neovim/nvim-lspconfig"

  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = 'nvim-lua/plenary.nvim',
  }

end)
