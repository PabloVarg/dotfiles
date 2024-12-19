return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.align").setup()
			require("mini.pairs").setup()
			require("mini.bracketed").setup()

			require("mini.ai").setup({
				n_lines = 1000,
			})

			require("mini.surround").setup({
				mappings = {
					replace = "sc",
				},
				n_lines = 1000,
				search_method = "cover_or_next",
			})
		end,
	},
}
