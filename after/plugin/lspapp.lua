-- if true then return end
require('nvim-lightbulb').setup {
  virtual_text = {
    enabled = false,
    text = '💡',
  },
  status_text = {
    enabled = false,
    text = '💡',
    text_unavailable = '',
  },
  autocmd = {
    enabled = true,
    pattern = { '*' },
    events = { 'CursorHold', 'CursorHoldI' },
  },
}
