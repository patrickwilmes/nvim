require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { "lua_ls", "clangd", "ltex", "marksman", "pylsp", "cmake", "html", "jsonls", "gopls", "kotlin_language_server" }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require("lspconfig").clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require("lspconfig").ltex.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require("lspconfig").marksman.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require("lspconfig").pylsp.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require("lspconfig").cmake.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require("lspconfig").html.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require("lspconfig").jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require("lspconfig").gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require("lspconfig").kotlin_language_server.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
