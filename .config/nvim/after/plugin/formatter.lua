require("formatter").setup({
	logging = false,

	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
        java = {
            require("formatter.filetypes.java").google_java_format,
        },
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		markdown = {
			require("formatter.filetypes.markdown").prettier,
		},
        go = {
            require("formatter.filetypes.go").gofumpt,
        },
        sql = {
             require("formatter.filetypes.sql").sqlfmt,
        },
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.keymap.set("n", "<leader>w", function()
	vim.cmd([[write]])
	vim.cmd([[FormatWrite]])
end)
