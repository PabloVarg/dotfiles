vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.keymap.set("n", "<leader>ex", ":.lua<CR>", { buffer = 0 })
vim.keymap.set("x", "<leader>ex", ":lua<CR>", { buffer = 0 })
vim.keymap.set("n", "<leader>eu", ":source %<CR>", { buffer = 0 })
