return {
	{
		"mistweaverco/kulala.nvim",
		enabled = true,
		ft = "http",
		config = function()
			require("kulala").setup({
				default_view = "headers_body",
			})

			vim.api.nvim_create_autocmd({ "FileType" }, {
				group = vim.api.nvim_create_augroup("kulala", { clear = true }),
				pattern = "http",
				callback = function(ev)
					vim.keymap.set("n", "<leader>ex", require("kulala").run, { buffer = ev.buf })
					vim.keymap.set("n", "<leader>eu", require("kulala").run_all, { buffer = ev.buf })
					vim.keymap.set("n", "<leader>et", require("kulala").search, { buffer = ev.buf })
					vim.keymap.set("n", "<leader>ei", require("kulala").inspect, { buffer = ev.buf })
					vim.keymap.set("n", "<leader>es", require("kulala").show_stats, { buffer = ev.buf })
					vim.keymap.set("n", "<leader>ey", require("kulala").copy, { buffer = ev.buf })
					vim.keymap.set("n", "<leader>ec", require("kulala").from_curl, { buffer = ev.buf })
					vim.keymap.set("n", "<leader>ev", require("kulala").set_selected_env, { buffer = ev.buf })
				end,
			})
		end,
	},
}
