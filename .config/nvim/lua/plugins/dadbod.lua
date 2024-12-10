return {
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
				sources = {
					{ name = "vim-dadbod-completion" },
					{ name = "buffer" },
				},
			})
		end,
	},
}
