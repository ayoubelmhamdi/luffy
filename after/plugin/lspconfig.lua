-- if true then return end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

local handlers = {

  ['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = true,
  }),
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
}

local on_attach = function(client, bufnr)
  -- plugins
  -- show the class>fun>int
  -- require('nvim-navic').attach(client, bufnr)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', ',lR', require('telescope.builtin').lsp_definitions, opts)
  vim.keymap.set('n', ',lr', require('telescope.builtin').lsp_references, opts)
  vim.keymap.set('n', ',ly', require('telescope.builtin').lsp_document_symbols, opts)
  vim.keymap.set('n', ',lY', require('telescope.builtin').lsp_workspace_symbols, opts)
  vim.keymap.set('n', ',ld', function()
    require('telescope.builtin').diagnostics { bufnr = 0 }
  end, opts)
  vim.keymap.set('n', ',lD', require('telescope.builtin').diagnostics, opts)
  vim.keymap.set('n', ',lrn', vim.lsp.buf.rename, { desc = 'LSP: rename' }, { buffer = bufnr })

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
  --
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

-- local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'dartls', 'texlab' }
local servers = { 'clangd', 'pyright', 'rust_analyzer', 'tsserver', 'dartls', 'texlab' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    handlers = handlers,
    capabilities = capabilities,
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
  }
end

require('lspconfig').grammarly.setup {
  handlers = handlers,
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = { clientId = 'client_BaDkMgx4X19X9UxxYRCXZo' },
}

-- clangd server setup
local clangd_capabilities = capabilities
clangd_capabilities.offsetEncoding = 'utf-8'

require('lspconfig').clangd.setup {
  handlers = handlers,
  capabilities = clangd_capabilities,
  on_attach = on_attach,
  single_file_support = true,
}

-- lua sumneko
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
local lua_dev = require('lua-dev').setup {
  library = {
    vimruntime = true,
    types = true,
    plugins = true,
  },
  lspconfig = {
    handlers = handlers,
    capabilities = capabilities,
    cmd = { 'sumneko' },
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          enable_check_codestyle = true,
          globals = {
            'packer_plugins',
            'use',
            'vim',
          },
          neededFileStatus = {
            codestyle_check = 'Any',
          },
        },
        format = {
          enable = true,
          defaultConfig = {
            indent_style = 'space',
            indent_size = 2,
            continuation_indent_size = 4,
            quote_style = 'single',
            call_arg_parentheses = 'keep',
            local_assign_continuation_align_to_first_expression = true,
            align_call_args = true,
            align_function_define_params = true,
            align_table_field_to_first_field = true,
            keep_one_space_between_table_and_bracket = true,
            keep_one_space_between_namedef_and_attribute = false,
            continuous_assign_statement_align_to_equal_sign = true,
            continuous_assign_table_field_align_to_equal_sign = true,
            do_statement_no_indent = false,
            if_condition_no_continuation_indent = false,
            if_condition_align_with_each_other = true,
          },
        },
        workspace = {
          library = {
            vim.api.nvim_get_runtime_file('', true),
          },
          checkThirdParty = false, -- FIX the sumneko need config
          -- Make the server await for loading Neovim runtime files
          maxPreload = 1000,
          preloadFileSize = 500,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
}

require('lspconfig').sumneko_lua.setup(lua_dev)
