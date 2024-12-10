return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc" },
				sync_install = false,
				auto_install = true,
				ignore_install = {},

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-s>",
						node_incremental = "<C-s>",
					},
				},

				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>pn"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>pp"] = "@parameter.inner",
						},
					},
					move = {
						enable = true,
						goto_next = {
							["]d"] = "@conditional.outer",
						},
						goto_previous = {
							["[d"] = "@conditional.outer",
						},
					},
				},

				refactor = {
					highlight_definitions = {
						enable = true,
						clear_on_cursor_move = true,
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = 3,
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-refactor", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			vim.g.skip_ts_context_commentstring_module = true

			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
	{ "windwp/nvim-ts-autotag", dependencies = { "nvim-treesitter/nvim-treesitter" }, config = true },
	{ "nvim-treesitter/nvim-treesitter-textobjects", dependencies = { "nvim-treesitter/nvim-treesitter" } },
}
