local treesj = require("treesj")

treesj.setup({
	use_default_keymaps = false,
})

vim.keymap.set({ "n", "x" }, "gS", treesj.toggle)
