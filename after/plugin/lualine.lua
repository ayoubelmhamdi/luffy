-- if true then
--   return
-- end
local myfilename = function()
    -- print("aa" .. vim.fn.expand('@%'))
    -- print("aa" .. expand('@%'))
    local path = vim.fn.expand('%p')
    return path
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
        lualine_a = { 'branch' },
        lualine_b = { myfilename },
        lualine_c = { {
            "overseer",
            label = '', -- Prefix for task counts
            colored = true, -- Color the task icons and counts
            unique = false, -- Unique-ify non-running task count by name
            name = nil, -- List of task names to search for
            name_not = false, -- When true, invert the name search
            status = nil, -- List of task statuses to display
            status_not = false, -- When true, invert the status search
        } },
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
        lualine_z = { 'progress' },
    },
}
