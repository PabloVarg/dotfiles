return {
	{
		"folke/zen-mode.nvim",
		config = function()
			local zen = function(width, height)
				require("zen-mode").setup({
					window = {
						width = width,
						height = height,
						options = {},
					},
				})

				require("zen-mode").toggle()

				vim.wo.wrap = false
				vim.wo.number = true
				vim.wo.rnu = true
			end

			vim.keymap.set("n", "<leader>za", function()
				zen(1, 1)
			end)
			vim.keymap.set("n", "<leader>zz", function()
				zen(90, 0.9)
			end)
		end,
	},
}
