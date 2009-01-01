require('telescope').setup {
  defaults = {
    prompt_prefix = '∷ ',
    selection_caret = '» ',
    dynamic_preview_title = true,
    wrap_results = true,
    file_ignore_patterns = { '.git/', 'db', 'gif', 'jpeg', 'jpg', 'ods', 'odt', 'pdf', 'png', 'svg', 'xcf', 'xls' },
    layout_strategy = 'bottom_pane',
    sorting_strategy = 'ascending',
    layout_config = {
      prompt_position = 'top',
      center = {
        mirror = true,
      },
      horizontal = {
        anchor = 'NE',
        height = 0.99,
        width = 0.66,
        preview_width = 0.55,
      },
      vertical = {
        anchor = 'NE',
        width = 0.50,
        height = 0.99,
        preview_cutoff = 4,
        preview_height = 0.66,
        mirror = true,
      },
    },
    mappings = {
      i = {
        ['<C-h>'] = 'which_key',
        ['<C-w>'] = require('telescope.actions.layout').toggle_preview,
        ['<C-q>'] = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist,
        ['<M-q>'] = require('telescope.actions').smart_add_to_qflist + require('telescope.actions').open_qflist,
      },
      n = {
        ['<C-h>'] = 'which_key',
        ['<C-w>'] = require('telescope.actions.layout').toggle_preview,
        ['<C-q>'] = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist,
        ['<M-q>'] = require('telescope.actions').smart_add_to_qflist + require('telescope.actions').open_qflist,
      },
    },
    preview = {
      msg_bg_fillchar = '░',
    },
    vimgrep_arguments = {
      'ugrep',
      '-RIjnkz',
      '--color=never',
      '--hidden',
      '--ignore-files',
      '--exclude-dir=".git"',
    },
  },
  pickers = {
    builtin = {
      layout_strategy = 'vertical',
      previewer = false,
    },
    colorscheme = {
      theme = 'dropdown',
      enable_preview = true,
    },
    diagnostics = {
      layout_strategy = 'vertical',
    },
    find_files = {
      find_command = { 'fd', '--exclude', '.git/' },
      follow = true,
      hidden = true,
      no_ignore = false,
    },
    filetypes = {
      theme = 'dropdown',
    },
    git_branches = {
      layout_strategy = 'vertical',
    },
    lsp_declarations = {
      layout_strategy = 'vertical',
    },
    lsp_definitions = {
      layout_strategy = 'vertical',
    },
    lsp_implementations = {
      layout_strategy = 'vertical',
    },
    lsp_references = {
      layout_strategy = 'vertical',
    },
    oldfiles = {
      layout_strategy = 'vertical',
      previewer = false,
    },
    spell_suggest = {
      theme = 'cursor',
      layout_config = {
        height = 14,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
}
require('telescope').load_extension 'fzf'
