return {
	{
		"mbbill/undotree",
		config = function()
			vim.opt.undofile = true
			vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

			vim.keymap.set("n", "<leader>\\", vim.cmd.UndotreeToggle)
		end,
	},
}
