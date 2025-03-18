-- This is lazy.lua if using lazy.nvim
-- File location
-- Windows: C:\Users\Admin\AppData\Local\nvim\lua\config
-- Linux: ~/.config/nvim/lua/config
-- This file is used to manage plugins
-- This file can be loaded by calling `require('lazy')` from your init.lua

-- Install lazy.nvim if you don't have it yet
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

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
