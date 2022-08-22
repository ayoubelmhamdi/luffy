vim.opt.laststatus = 3
vim.opt.fillchars:append {
  horiz = '─',
  horizup = '┴',
  horizdown = '┬',
  vert = '│',
  vertleft = '┤',
  vertright = '├',
  verthoriz = '┼',
  msgsep = '🮑',
}

vim.opt.timeoutlen = 500
vim.opt.updatetime = 100
vim.opt.autowrite = true
vim.opt.modelineexpr = true
vim.opt.keywordprg = ':help'

My_Borders = 'rounded'

-- diagnostic handling
local diagnostic_signs = { '', '', '', '' }
local diagnostic_severity_fullnames = { 'Error', 'Warning', 'Information', 'Hint' }
local diagnostic_severity_shortnames = { 'Error', 'Warn', 'Info', 'Hint' }
for index, icon in ipairs(diagnostic_signs) do
  local fullname = diagnostic_severity_fullnames[index]
  local shortname = diagnostic_severity_shortnames[index]

  vim.fn.sign_define('DiagnosticSign' .. shortname, {
    text = icon,
    texthl = 'Diagnostic' .. shortname,
    linehl = '',
    numhl = '',
  })

  vim.fn.sign_define('LspDiagnosticsSign' .. fullname, {
    text = icon,
    texthl = 'LspDiagnosticsSign' .. fullname,
    linehl = '',
    numhl = '',
  })
end
vim.diagnostic.config {
  float = {
    border = My_Borders,
    header = '',
    focusable = false,
    scope = 'cursor',
    source = 'always',
  },
  virtual_text = false,
}


-- filetype handling
vim.filetype.add {
  extension = {
    conf = 'config',
    config = 'config',
    htp = 'xhtml',
    htt = 'xhtml',
    rc = 'rc',
    xmp = 'xml',
  },
  pattern = {
    ['/tmp/mutt.*'] = 'mail',
    ['/tmp/.*tangoartisan.*'] = 'html',
    ['/tmp/.*voswimmer.nl.*'] = 'html',
    ['~/%.mutt/.*rc'] = 'muttrc',
  },
}
