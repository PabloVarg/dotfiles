vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "lua",
	group = vim.api.nvim_create_augroup("lua", { clear = true }),
	callback = function()
		vim.keymap.set("n", "<leader>ex", ":.lua<CR>")
		vim.keymap.set("x", "<leader>ex", ":lua<CR>")
		vim.keymap.set("n", "<leader>eu", ":source %<CR>")
	end,
})

print("test")
