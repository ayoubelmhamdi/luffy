local treesitter = require 'nvim-treesitter.configs'
local i = require 'nvim-treesitter.install'

i.update { with_sync = true }

treesitter.setup {
  ensure_installed = {
    'c',
    'comment',
    'dart',
    'html',
    'java',
    'javascript',
    'json',
    'kotlin',
    'latex',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'python',
    'rust',
    'toml',
    'vim',
    'yaml',
  },
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
  textobjects = {
    lookahead = true,
    lsp_interop = {
      enable = true,
      border = 'rounded',
      peek_definition_code = {
        ['df'] = '@function.outer',
        ['dF'] = '@class.outer',
      },
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ap'] = '@parameter.outer',
        ['ip'] = '@parameter.inner',
        ['ab'] = '@block.outer',
        ['ib'] = '@block.inner',
        ['am'] = '@class.outer',
        ['im'] = '@class.inner',
        ['aa'] = '@call.outer',
        ['ia'] = '@call.inner',
        ['a/'] = '@comment.outer',
        ['i/'] = '@comment.inner',
      },
    },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  refactor = {
    highlight_current_scope = { enable = true },
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = 'gnd',
        list_definitions_lsp_fallback = 'gnD',
        list_definitions_toc = 'gO',
        goto_next_usage = '<a-*>',
        goto_previous_usage = '<a-#>',
      },
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = 'grr',
      },
    },
  },
  --
  --
}

require('spellsitter').setup {
  enable = true,
}
