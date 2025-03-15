-- This is init.lua if using packer.nvim
-- File location: C:\Users\Admin\AppData\Local\nvim
-- Load plugins
require('plugins')

-- Setup nvim-cmp (autocomplete plugin)
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- Expand snippets
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),    -- Trigger completion manually
    ['<C-e>'] = cmp.mapping.abort(),           -- Close completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm completion
    ['<Tab>'] = cmp.mapping.select_next_item(), -- Next item in completion
    ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- Previous item in completion
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- LSP source
    { name = 'buffer' },    -- Buffer source (current file's words)
    { name = 'path' },      -- Path source (for file paths)
  }),
})

-- Setup LSP for TypeScript
local lspconfig = require'lspconfig'

-- TypeScript Language Server (ts_ls)
lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    -- Keybindings for LSP
    local buf_set_keymap = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }

    -- Define LSP keymaps for this buffer (e.g., go to definition, hover)
    buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  end,
})

-- Theme configuration
vim.cmd([[colorscheme onedark]])

-- Additional settings
vim.opt.number = true       -- Show line numbers
vim.opt.tabstop = 4         -- Set tabstop to 4 spaces
vim.opt.shiftwidth = 4      -- Set shiftwidth to 4 spaces
vim.opt.expandtab = true    -- Convert tabs to spaces
vim.opt.termguicolors = true -- Enable true color support
