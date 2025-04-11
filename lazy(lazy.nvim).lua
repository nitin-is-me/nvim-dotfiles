-- This is lazy.lua if using lazy.nvim
-- File location
-- Windows: C:\Users\Admin\AppData\Local\nvim\lua\config
-- Linux: ~/.config/nvim/lua/config
-- This file is used to manage plugins
-- This file can be loaded by calling `require('lazy')` from your init.lua

-- Clone the lazy.nvim repo to "lazy" folder which is inside nvim data folder. The location of Nvim data folder is:
-- Windows: C:\Users\Admin\AppData\Local\nvim-data
-- Linux: ~/.local/share/nvim
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

    {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Automatically run `:TSUpdate` on install
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Essential features
        highlight = { enable = true },  -- Better syntax highlighting
        indent = { enable = true },     -- Smart indentation
        auto_install = true,           -- Auto-install parsers for detected filetypes

        -- Optional but recommended:
        ensure_installed = {           -- Pre-install parsers (faster startup)
        "javascript", "typescript", "bash", "json", "html", "css", "markdown"
        },
      })
    end
  },

 {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },  -- Required dependency
  config = function()
    local builtin = require("telescope.builtin")
    -- Keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep (text)" }) -- Install ripgrep package for this
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
  end,
}



  -- LSP configurations
  { 'neovim/nvim-lspconfig' },

  -- Auto-completion plugin
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },   -- LSP source for nvim-cmp
  { 'hrsh7th/cmp-buffer' },      -- Buffer source for nvim-cmp
  { 'hrsh7th/cmp-path' },        -- Path source for nvim-cmp
})
