local augroup = vim.api.nvim_create_augroup("harpoon", {})
vim.api.nvim_create_autocmd({ "User" }, {
	pattern = "RooterChDir",
	group = augroup,
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
