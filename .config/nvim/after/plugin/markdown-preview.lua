vim.g.mkdp_auto_close = 0
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_open_to_the_world = 1
vim.g.mkdp_browserfunc = "g:Open_browser_incognito"
vim.g.Open_browser_incognito = vim.cmd([[
function! g:Open_browser_incognito(url)
    silent exec "Start! $BROWSER --private-window " . a:url
endfunction
]])

local augroup = vim.api.nvim_create_augroup("markdown", {})

vim.api.nvim_create_autocmd({ "Filetype" }, {
	group = augroup,
	pattern = "markdown",
	command = [[noremap <leader>tv :MarkdownPreviewToggle<CR>]],
})
