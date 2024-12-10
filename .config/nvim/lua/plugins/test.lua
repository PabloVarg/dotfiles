return {
	{
		"vim-test/vim-test",
		config = function()
			vim.g["test#strategy"] = "floaterm"

			vim.keymap.set("n", "<leader>TT", vim.cmd.TestFile)
			vim.keymap.set("n", "<leader>TN", vim.cmd.TestNearest)
			vim.keymap.set("n", "<leader>TS", vim.cmd.TestSuite)
			vim.keymap.set("n", "<leader>TL", vim.cmd.TestLast)
		end,
	},
}
