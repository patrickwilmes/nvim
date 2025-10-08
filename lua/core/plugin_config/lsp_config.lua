-- Mason installers
require('mason').setup({ log_level = vim.log.levels.DEBUG })
require('mason-lspconfig').setup({
  ensure_installed = {
    "lua_ls","clangd","ltex","marksman","pylsp","cmake","html","jsonls","gopls","zls"
  }
})

-- Capabilities (cmp)
local capabilities = require('cmp_nvim_lsp')
  .default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Prefer LspAttach for buffer-local keymaps (recommended by Nvim docs)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local buf = args.buf
    local map = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, { buffer = buf }) end
    map('n','<leader>rn', vim.lsp.buf.rename)
    map('n','<leader>ca', vim.lsp.buf.code_action)
    map('n','gd',        vim.lsp.buf.definition)
    map('n','gi',        vim.lsp.buf.implementation)
    map('n','gr',        require('telescope.builtin').lsp_references)
    map('n','K',         vim.lsp.buf.hover)
  end,
})

-- Optionally set defaults for ALL servers
vim.lsp.config('*', {
  capabilities = capabilities,
})

-- Per-server tweaks (only where you need them)
vim.lsp.config('lua_ls', {
  settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
})
-- (Add per-server blocks only if you have special settings)

-- Finally: enable the servers (auto-start by filetype/root)
vim.lsp.enable({
  'lua_ls','clangd','ltex','marksman','pylsp','cmake','html','jsonls','gopls','zls'
})

