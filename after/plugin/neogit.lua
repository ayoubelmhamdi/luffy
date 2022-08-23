local ok, neogit = pcall(require, "neogit")
if not ok then
  return
end

neogit.setup {
    integrations = {
        diffview = true,
    }
}

vim.keymap.set("n", "<leader>dv", ":DiffviewFileHistory %<cr>")

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>")
vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<CR>")
vim.keymap.set("n", "<leader>gP", "<cmd>Neogit push<CR>")
vim.keymap.set("n", "<leader>gp", "<cmd>Neogit pull<CR>")

