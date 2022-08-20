local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
-- local code_actions = null_ls.builtins.code_actions
-- local hover = null_ls.builtins.hover

null_ls.setup({
	sources = {
        formatting.uncrustify,
        diagnostics.cppcheck,
        -- diagnostics.gccdiag,
        -- formatting.clang_format,
        -- formatting.astyle,
        completion.spell,
        completion.luasnip,
	},
})
