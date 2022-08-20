local null_ls = require 'null-ls'
local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
-- local hover = null_ls.builtins.hover

null_ls.setup {
  sources = {
    -- diagnostics.selene,
    formatting.stylua,
    completion.spell,
    completion.luasnip,
    code_actions.refactoring,
  },
}
