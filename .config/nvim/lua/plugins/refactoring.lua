return {
	{
		"theprimeagen/refactoring.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("refactoring").setup()

			vim.keymap.set("x", "<leader>er", function()
				require("refactoring").select_refactor()
			end)

			vim.keymap.set("n", "<leader>ep", function()
				require("refactoring").debug.printf({ below = false })
			end)

			vim.keymap.set("x", "<leader>ep", function()
				require("refactoring").debug.print_var()
			end)

			vim.keymap.set("n", "<leader>ec", function()
				require("refactoring").debug.cleanup({})
			end)
		end,
	},
}
