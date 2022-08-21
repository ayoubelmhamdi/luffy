
-- highlight text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 300,
      on_visual = true,
    }
  end,
})

vim.api.nvim_command [[
nnoremap x "_x
nnoremap X "_X
nnoremap c "_c
nnoremap C "_C

vnoremap x "_x
vnoremap X "_X
vnoremap c "_c
vnoremap C "_C

" noremap  y "*y
" noremap  Y "*Y
" vnoremap y "*y
" vnoremap Y "*Y

noremap  p "*pgvy
noremap  P "*Pgvy
vnoremap p "*pgvy
vnoremap P "*Pgvy
]]


-- Switch between tabs
-- local opts = { noremap = true, silent = true }

-- vim.keymap.set("n", "<Right>", function()
--     vim.cmd [[checktime]]
--     vim.api.nvim_feedkeys("gt", "n", true)
-- end)
--
-- vim.keymap.set("n", "<Left>", function()
--     vim.cmd [[checktime]]
--     vim.api.nvim_feedkeys("gT", "n", true)
-- end)

-- vim.keymap.set('n', '<F10>', function()
--   if vim.o.conceallevel > 0 then
--     vim.o.conceallevel = 0
--   else
--     vim.o.conceallevel = 2
--   end
-- end, opts)
--
-- vim.keymap.set('n', '<F11>', function()
--   if vim.o.concealcursor == 'n' then
--     vim.o.concealcursor = ''
--   else
--     vim.o.concealcursor = 'n'
--   end
-- end, opts)
