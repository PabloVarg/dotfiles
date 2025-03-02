return {
	{
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
		{
			"VonHeikemen/lsp-zero.nvim",
			dependencies = {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"neovim/nvim-lspconfig",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/nvim-cmp",
				"saadparwaiz1/cmp_luasnip",
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
				require("luasnip.loaders.from_vscode").lazy_load()

				local builtin = require("telescope.builtin")

				vim.keymap.set({ "n", "i" }, "<F4>", "<nop>")
				vim.keymap.set({ "n", "i" }, "<S-F4>", "<nop>")

				vim.diagnostic.config({
					virtual_text = true,
					update_in_insert = true,
					severity_sort = true,
				})

				local lsp_zero = require("lsp-zero")
				lsp_zero.extend_lspconfig()
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

					vim.keymap.set("n", "<leader>ea", vim.lsp.buf.code_action, opts)
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

				local cmp = require("cmp")
				local cmp_action = require("lsp-zero").cmp_action()
				local cmp_select = { behavior = cmp.SelectBehavior.Select }
				cmp.setup({
					sources = {
						{ name = "path" },
						{ name = "nvim_lsp" },
						{ name = "nvim_lua" },
						{ name = "luasnip" },
					},
					mapping = cmp.mapping.preset.insert({
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
						["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
						["<Tab>"] = cmp.mapping.confirm({ select = true }),
						["<F4>"] = cmp_action.luasnip_jump_forward(),
						["<S-F4>"] = cmp_action.luasnip_jump_backward(),
					}),
					formatting = lsp_zero.cmp_format({}),
					preselect = "item",
					completion = {
						completeopt = "menu,menuone,noinsert",
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},
				})
			end,
		},
	},
}
