return {
	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.api.nvim_create_autocmd({ "DirChanged" }, {
				group = vim.api.nvim_create_augroup("harpoon", {}),
				callback = function()
					local harpoon = require("harpoon")

					harpoon:setup()

					vim.keymap.set("n", "<leader>n;", function()
						harpoon:list():add()
					end)

					vim.keymap.set("n", "<leader>n.", function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end)

					vim.keymap.set("n", "<leader>nu", function()
						harpoon:list():select(1)
					end)
					vim.keymap.set("n", "<leader>ne", function()
						harpoon:list():select(2)
					end)
					vim.keymap.set("n", "<leader>no", function()
						harpoon:list():select(3)
					end)
					vim.keymap.set("n", "<leader>na", function()
						harpoon:list():select(4)
					end)
				end,
			})
		end,
	},
}
