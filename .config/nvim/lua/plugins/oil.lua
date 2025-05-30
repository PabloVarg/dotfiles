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
				use_default_keymaps = false,
				keymaps = {
					["g?"] = { "actions.show_help", mode = "n" },
					["<CR>"] = "actions.select",
					["<C-v>"] = { "actions.select", opts = { vertical = true } },
					["<C-s>"] = { "actions.select", opts = { horizontal = true } },
					["<C-p>"] = "actions.preview",
					["<C-c>"] = { "actions.close", mode = "n" },
					["<C-r>"] = "actions.refresh",
					["-"] = { "actions.parent", mode = "n" },
					["_"] = { "actions.open_cwd", mode = "n" },
					["`"] = { "actions.cd", mode = "n" },
					["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
					["gs"] = { "actions.change_sort", mode = "n" },
					["gx"] = "actions.open_external",
					["g."] = { "actions.toggle_hidden", mode = "n" },
					["g\\"] = { "actions.toggle_trash", mode = "n" },
				},
			})

			vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { silent = true })
			vim.keymap.set("n", "-", require("oil").open, { silent = true })
		end,
	},
}
