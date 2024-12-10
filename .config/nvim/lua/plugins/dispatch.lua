return {
	{
		"tpope/vim-dispatch",
		config = function()
			vim.keymap.set("n", "<leader>ps", ":execute 'Spawn!' get(b:, 'start', '')<CR>")
			vim.keymap.set("n", "<leader>pf", ":execute 'Spawn' get(b:, 'start', '')<CR>")
			vim.keymap.set("n", "<leader>pd", [[:Dispatch!<CR>]])
			vim.keymap.set("n", "<leader>pm", [[:Make!<CR>]])
			vim.keymap.set("n", "<leader>pc", vim.cmd.Console)
			vim.keymap.set("n", "<leader>ce", vim.cmd.Copen)
		end,
	},
}
