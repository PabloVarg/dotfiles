return {
	{
		"floaterm",
		dir = vim.fn.stdpath("config") .. "/lua/floaterm",
		config = function()
			local floaterm = require("floaterm")
			floaterm:setup({})

			vim.keymap.set({ "n", "t" }, "<C-t>", function()
				floaterm:toggle(0.6, 0.6)
			end)
		end,
	},
}
