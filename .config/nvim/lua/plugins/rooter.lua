return {
	{
		"airblade/vim-rooter",
		config = function()
			vim.g.netrw_keepdir = 0

			vim.g.rooter_silent_chdir = true
			vim.g.rooter_patterns = {
				".git",
				"pom.xml",
				"node_modules",
				"Makefile",
			}
		end,
	},
}
