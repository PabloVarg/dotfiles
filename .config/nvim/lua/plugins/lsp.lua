return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"neovim/nvim-lspconfig",
				dependencies = { "saghen/blink.cmp" },
				config = function()
					local lspconfig_defaults = require("lspconfig").util.default_config
					lspconfig_defaults.capabilities = vim.tbl_deep_extend(
						"force",
						lspconfig_defaults.capabilities,
						require("blink.cmp").get_lsp_capabilities()
					)
				end,
			},
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		branch = "v3.x",
		config = function()
			vim.diagnostic.config({
				virtual_text = true,
				update_in_insert = true,
				severity_sort = true,
			})

			local builtin = require("telescope.builtin")
			local lsp_zero = require("lsp-zero")
			lsp_zero.on_attach(function(_, bufnr)
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "]g", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
				vim.keymap.set("n", "gy", builtin.lsp_type_definitions, opts)
				vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
				vim.keymap.set("n", "gr", builtin.lsp_incoming_calls, opts)
				vim.keymap.set("n", "go", builtin.lsp_outgoing_calls, opts)
				vim.keymap.set("n", "gR", builtin.lsp_references, opts)

				vim.keymap.set("n", "<leader>ed", builtin.diagnostics, opts)
				vim.keymap.set("n", "<leader>et", builtin.lsp_document_symbols, opts)
				vim.keymap.set("n", "<leader>es", builtin.lsp_dynamic_workspace_symbols, opts)

				vim.keymap.set({ "n", "x" }, "<leader>ea", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>er", vim.lsp.buf.rename, opts)
				vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
			end)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				automatic_installation = false,
				ensure_installed = { "lua_ls" },
				handlers = {
					lsp_zero.default_setup,
				},
			})
		end,
	},
}
