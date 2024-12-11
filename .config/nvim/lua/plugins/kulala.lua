return {
	{
		"mistweaverco/kulala.nvim",
		enabled = false,
		ft = "http",
		config = function()
			require("kulala").setup({
				default_view = "headers_body",
			})

			vim.keymap.set("n", "<leader>ex", require("kulala").run)
			vim.keymap.set("n", "<leader>eu", require("kulala").run_all)
			vim.keymap.set("n", "<leader>et", require("kulala").search)
			vim.keymap.set("n", "<leader>ei", require("kulala").inspect)
			vim.keymap.set("n", "<leader>es", require("kulala").show_stats)
			vim.keymap.set("n", "<leader>ey", require("kulala").copy)
			vim.keymap.set("n", "<leader>ec", require("kulala").from_curl)
			vim.keymap.set("n", "<leader>ev", require("kulala").set_selected_env)
		end,
	},
}
