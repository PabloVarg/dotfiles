return {
	{
		"vim-test/vim-test",
		config = function()
			vim.g["test#custom_strategies"] = {
				custom = function(cmd)
					require("floaterm"):send({ cmd = cmd })
				end,
			}
			vim.g["test#strategy"] = "custom"

			vim.keymap.set("n", "<leader>TT", vim.cmd.TestFile)
			vim.keymap.set("n", "<leader>TN", vim.cmd.TestNearest)
			vim.keymap.set("n", "<leader>TS", vim.cmd.TestSuite)
			vim.keymap.set("n", "<leader>TL", vim.cmd.TestLast)
		end,
	},
}
