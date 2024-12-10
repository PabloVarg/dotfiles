return {
	{
		"puremourning/vimspector",
		config = function()
			vim.keymap.set("n", "<leader>db", vim.fn["vimspector#ListBreakpoints"])
			vim.keymap.set("n", "<leader>dc", function()
				vim.fn["vimspector#ClearBreakpoints"]()
				vim.opt.signcolumn = "no"
			end)

			vim.keymap.set("n", "<leader>dl", vim.fn["vimspector#GoToCurrentLine"])
			vim.keymap.set("n", "<leader>dd", vim.fn["vimspector#JumpToProgramCounter"])
			vim.keymap.set("n", "<leader>dtc", vim.fn["vimspector#RunToCursor"])
			vim.keymap.set("n", "<leader>de", vim.fn["vimspector#StepOver"])
			vim.keymap.set("n", "<leader>di", vim.fn["vimspector#StepInto"])
			vim.keymap.set("n", "<leader>do", vim.fn["vimspector#StepOut"])

			-- vim.keymap.set("n", "<leader>dx", vim.fn["vimspector#Launch"])
			vim.keymap.set("n", "<leader>dx", vim.fn["vimspector#Continue"])
			vim.keymap.set("n", "<leader>dq", vim.cmd.VimspectorReset)
			vim.keymap.set("n", "<leader>dr", vim.fn["vimspector#Restart"])

			vim.keymap.set("n", "<leader>tb", function()
				vim.fn["vimspector#ToggleBreakpoint"]()
				vim.opt.signcolumn = "yes:2"
			end)
			vim.keymap.set("n", "<leader>tc", "<Plug>VimspectorToggleConditionalBreakpoint")
			vim.keymap.set("n", "<leader>dpf", "<Plug>VimspectorAddFunctionBreakpoint")

			vim.keymap.set("n", "<leader>dk", "<Plug>VimspectorUpFrame")
			vim.keymap.set("n", "<leader>dj", "<Plug>VimspectorDownFrame")

			vim.keymap.set({ "x", "n" }, "<leader>di", "<Plug>VimspectorBalloonEval")

			vim.keymap.set("n", "[b", vim.fn["vimspector#JumpToPreviousBreakpoint"])
			vim.keymap.set("n", "]b", vim.fn["vimspector#JumpToNextBreakpoint"])
		end,
	},
}
