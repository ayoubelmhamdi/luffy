--
--{{{ # Load the lua snippets
require('luasnip.loaders.from_lua').lazy_load()
--}}}
--{{{ # Create Command!: LuaSnipEdit
vim.cmd [[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]
--}}}
