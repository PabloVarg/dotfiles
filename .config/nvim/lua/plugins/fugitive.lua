return {
	{
		"tpope/vim-fugitive",
		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>G", ":G<Space>")
			vim.keymap.set("n", "<leader>tg", vim.cmd.Git)
			vim.keymap.set("n", "<leader>gu", ":diffget //2<CR>")
			vim.keymap.set("n", "<leader>gh", ":diffget //3<CR>")
			vim.keymap.set("n", "<leader>gb", builtin.git_branches)
			vim.keymap.set("n", "<leader>gl", builtin.git_commits)
			vim.keymap.set("n", "<leader>gf", builtin.git_bcommits)
			vim.keymap.set("n", "<leader>gs", builtin.git_status)
			vim.keymap.set("n", "<leader>gz", builtin.git_stash)

			vim.keymap.set("n", "<leader>gw", require("telescope").extensions.git_worktree.git_worktrees)
			vim.keymap.set("n", "<leader>gW", require("telescope").extensions.git_worktree.create_git_worktree)
		end,
	},
}
