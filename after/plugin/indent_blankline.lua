-- if true then return end
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars:append "eol:↴"
-- vim.opt.listchars:append "space:⋅"

vim.cmd[[
hi Indent1 guifg=#0A0A0A gui=nocombine
hi Indent2 guifg=#1A1A1A gui=nocombine
hi Indent3 guifg=#1A1A1A gui=nocombine
hi Indent4 guifg=#1A1A1A gui=nocombine
hi Indent5 guifg=#1A1A1A gui=nocombine
hi Indent6 guifg=#1A1A1A gui=nocombine
]]


require("indent_blankline").setup {
    show_end_of_line = true,
        char_highlight_list = {
            "Indent1",
            "Indent2",
            "Indent3",
            "Indent4",
            "Indent5",
            "Indent6",
    },
}

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#NONE ]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
