
print("hello world")

require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR")

-- Highlight yank'd text

vim.api.nvim_create_autocmd('TextYankPost', {
 desc = 'Highlight when yanking',
 group = vim.api.nvim_create_augroup('kickstart-hightlight-yank', {clear = true}),
 callback = function()
  vim.highlight.on_yank()
 end,
})

