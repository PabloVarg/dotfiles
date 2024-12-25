local augroup = vim.api.nvim_create_augroup("base", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	group = augroup,
	pattern = "*",
	command = [[:silent! !]],
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup,
	pattern = "*",
	command = [[setlocal formatoptions -=ro]],
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = augroup,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			timeout = 50,
		})
	end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})
