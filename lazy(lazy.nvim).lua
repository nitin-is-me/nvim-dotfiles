-- This is lazy.lua if using lazy.nvim
-- File location : C:\Users\Admin\AppData\Local\nvim\lua\config
-- This file is used to manage plugins
-- This file can be loaded by calling `require('lazy')` from your init.lua

-- Install lazy.nvim if you don't have it yet
vim.cmd [[packadd lazy.nvim]]

return require('lazy').setup({

  -- Auto pairs
  { 'jiangmiao/auto-pairs' },

  -- Onedark theme
  { 'joshdick/onedark.vim' },

  -- LSP configurations
  { 'neovim/nvim-lspconfig' },

  -- Auto-completion plugin
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },   -- LSP source for nvim-cmp
  { 'hrsh7th/cmp-buffer' },      -- Buffer source for nvim-cmp
  { 'hrsh7th/cmp-path' },        -- Path source for nvim-cmp
})
