vim.keymap.set("n", "<leader>d;", "<Plug>VimspectorContinue")
vim.keymap.set("n", "<leader>d,", "<Plug>VimspectorStop")
vim.keymap.set("n", "<leader>d.", "<Plug>VimspectorRestart")
vim.keymap.set("n", "<leader>dw", "<Plug>VimspectorPause")

vim.keymap.set("n", "<leader>dx", vim.cmd.VimspectorReset)

vim.keymap.set("n", "<leader>tb", "<Plug>VimspectorToggleBreakpoint")
vim.keymap.set("n", "<leader>tc", "<Plug>VimspectorToggleConditionalBreakpoint")
vim.keymap.set("n", "<leader>dpf", "<Plug>VimspectorAddFunctionBreakpoint")

vim.keymap.set("n", "<leader>dru", "<Plug>VimspectorRunToCursor")
vim.keymap.set("n", "<leader>dre", "<Plug>VimspectorStepOver")
vim.keymap.set("n", "<leader>dri", "<Plug>VimspectorStepInto")
vim.keymap.set("n", "<leader>dro", "<Plug>VimspectorStepOut")

vim.keymap.set("n", "<leader>dk", "<Plug>VimspectorUpFrame")
vim.keymap.set("n", "<leader>dj", "<Plug>VimspectorDownFrame")
vim.keymap.set({ "x", "n" }, "<leader>di", "<Plug>VimspectorBalloonEval")
