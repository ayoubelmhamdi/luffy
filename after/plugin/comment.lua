local comment = require 'Comment'
comment.setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  padding = true,
  sticky = true,
  ignore = nil,
  toggler = {
    line = 'gcc',
    block = 'gbc',
  },
  opleader = {
    line = 'gc',
    block = 'gb',
  },
  extra = {
    above = 'gcO',
    below = 'gco',
    eol = 'gcA',
  },
  mappings = {
    basic = true,
    extra = true,
    extended = false,
  },
  pre_hook = nil,
  post_hook = nil,
}
