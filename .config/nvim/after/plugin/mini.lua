require("mini.align").setup()
require("mini.pairs").setup()
require("mini.splitjoin").setup()
require("mini.bracketed").setup()

require("mini.surround").setup({
	mappings = {
		replace = "sc",
	},
	n_lines = 1000,
})
