local vimrc = vim.fn.findfile('run_buf.lua', ',;')
if string.len(vimrc) >= 1 then
    require(string.sub(vimrc,1,-5))
end
-- print('run_buf.lua: ' .. vimrc)
-- else
--     print("else1")
