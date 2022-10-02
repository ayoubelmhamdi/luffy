-- local vimrc = vim.fn.findfile('run_buf.lua', ',;')
-- if string.len(vimrc) >= 1 then
--   print('vimrc: ' .. vimrc)
--   require(string.sub(vimrc, 1, -5))
-- end
-- print('run_buf.lua: ' .. vimrc)
-- else

local vimrc = 'run_buf.lua'
local root = vim.fn.expand '%:p:h'
local file = io.open(vimrc, 'r')
if file ~= nil then
  io.close(file)
  print('found: ' .. root .. '/' .. vimrc)
  vim.cmd('source' .. root .. '/' .. vimrc)
  -- require(string.sub(file, 1, -5))
  return true
else
  return false
end
