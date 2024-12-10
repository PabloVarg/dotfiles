return {
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				float = {
					padding = 2,
					max_width = 80,
				},
			})

			vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { silent = true })
		end,
	},
}
