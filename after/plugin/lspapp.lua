-- if true then return end
vim.fn.sign_define('LightBulbSign', { text = ' ', texthl = 'WarningMsg', linehl = '', numhl = '' })
require('nvim-lightbulb').update_lightbulb()
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]

-- require('lsp_lines').setup()
vim.keymap.set('', ',ll', require('lsp_lines').toggle, { desc = 'Toggle lsp_lines' })

