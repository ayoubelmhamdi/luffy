-- if true then return end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

local on_attach = function(client, bufnr)
  require('nvim-navic').attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- keymap
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
  vim.keymap.set('n', ',de', function()
    vim.diagnostic.enable()
    vim.notify('Diagnostics enabled', vim.log.levels.INFO, { title = '[LSP]' })
  end)
  vim.keymap.set('n', ',dd', function()
    vim.diagnostic.disable()
    vim.notify('Diagnostics disabled', vim.log.levels.INFO, { title = '[LSP]' })
  end)
  vim.keymap.set('n', '[d', function()
    vim.diagnostic.goto_prev { float = false }
  end)
  vim.keymap.set('n', ']d', function()
    vim.diagnostic.goto_next { float = false }
  end)
  vim.keymap.set('n', ',df', vim.diagnostic.open_float)
  vim.keymap.set('n', ',dl', vim.diagnostic.setloclist)
  vim.keymap.set('n', ',dq', vim.diagnostic.setqflist)

  -- ovrride by nvim-ufo
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

local servers = { 'clangd', 'pyright', 'rust_analyzer', 'tsserver', 'dartls', 'texlab' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
  }
end

require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'sumneko' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false, -- FIX the sumneko need config
        -- Make the server await for loading Neovim runtime files
        maxPreload = 2000,
        preloadFileSize = 50000,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
