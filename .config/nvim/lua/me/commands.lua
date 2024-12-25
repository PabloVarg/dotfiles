local augroup = vim.api.nvim_create_augroup("base", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	group = augroup,
	pattern = "*",
	command = [[:silent! !]],
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup,
	command = [[tabdo wincmd =]],
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup,
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove("o")
		vim.opt_local.formatoptions:remove("r")
	end,
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
