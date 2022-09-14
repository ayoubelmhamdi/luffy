-- if true then
--   return
-- end
local myfilename = function()
    -- print("aa" .. vim.fn.expand('@%'))
    -- print("aa" .. expand('@%'))
    local path= vim.fn.expand('%p')
    return  path
end

local lsp_server = function()
  local msg = 'No Active Lsp'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
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
    lualine_c = { myfilename },
    -- lualine_c = {
    --   {
    --     'filename',
    --     file_status = true, -- Displays file status (readonly status, modified status)
    --     path = 2, -- 0: Just the filename
    --     shorting_target = 80, -- Shortens path to leave 40 spaces in the window
    --     symbols = {
    --       modified = '[+]', -- Text to show when the file is modified.
    --       readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
    --       unnamed = '[No Name]', -- Text to show for unnamed buffers.
    --     },
    --   },
    -- },
    lualine_x = { '' },
    lualine_y = {
      {
        lsp_server,
        icon = '',
        -- If you want to give the LSP name color then use the line below and
        -- change the hex code to the color you want:
        -- color = {fg = '#ffffff', gui = 'bold'}
      },
    'diagnostics',
    'lsp_progress'
    },
    lualine_z = {  'progress' },
  },
}
