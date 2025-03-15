-- This file can be loaded by calling `require('plugins')` from your init.lua

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Auto pairs
  use 'jiangmiao/auto-pairs'

  -- Onedark theme
  use 'joshdick/onedark.vim'

 -- LSP configurations
  use 'neovim/nvim-lspconfig'

  -- Auto-completion plugin
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'   -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'     -- Buffer source for nvim-cmp
  use 'hrsh7th/cmp-path'       -- Path source for nvim-cmp

end)
