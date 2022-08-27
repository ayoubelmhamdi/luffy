-- if true then
--   return
-- end

local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then
      return ''
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
      return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
    end
    return str
  end
end

local lsp_status = function()
  local msg = ''
  if #vim.lsp.get_active_clients() > 0 then
    msg = '[LSP]'
  end
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    msg = msg .. '‹' .. client.name .. '›'
    for _, progress in pairs(client.messages.progress) do
      if not progress.done then
        msg = progress.title
        if progress.message then
          msg = msg .. ' ' .. progress.message
        end
        if progress.percentage then
          msg = string.format('%s%2d%s', '⸢', progress.percentage, '%%⸥')
        end
        return msg
      end
    end
  end
  return msg
end

require('lualine').setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { '' },
    lualine_b = { 'branch' },
    lualine_c = {
      {
        'filename',
        file_status = true, -- Displays file status (readonly status, modified status)
        path = 2, -- 0: Just the filename
        shorting_target = 80, -- Shortens path to leave 40 spaces in the window
        symbols = {
          modified = '[+]', -- Text to show when the file is modified.
          readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
        },
      },
    },
    lualine_x = {
      {
        -- function()
        --   return require('lsp-status').status()
        -- end,
        lsp_status,
        fmt = trunc(120, 20, 60),
      },
    },
    lualine_y = { 'progress' },
    lualine_z = { 'diagnostics' },
  },
}
