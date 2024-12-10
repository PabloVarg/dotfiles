return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				contrast = "hard",
				invert_selection = false,
			})

			vim.o.background = "dark"
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
