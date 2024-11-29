local treesj = require("treesj")

treesj.setup({
	use_default_keymaps = false,
	max_join_length = 10000,
})

vim.keymap.set("n", "gS", treesj.toggle)
