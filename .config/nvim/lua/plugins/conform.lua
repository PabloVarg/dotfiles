return {
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")

			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

			conform.setup({
				format_after_save = function(bufnr)
					-- Disable with a global or buffer-local variable
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return { timeout_ms = 1500, lsp_format = "fallback" }
				end,
				formatters_by_ft = {
					["_"] = {
						"trim_whitespace",
						"trim_newlines",
					},
					lua = { "stylua" },
					rust = { "rustfmt" },
					python = { "ruff_format", "black", stop_after_first = true },
					java = { "google_java_format" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
					markdown = { "prettierd", "prettier", stop_after_first = true },
					json = { "prettierd", "prettier", stop_after_first = true },
					go = { "gofumpt", "golines" },
					sql = { "sqlfmt" },
				},
			})

			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					-- FormatDisable! will disable formatting just for this buffer
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, {
				desc = "Disable autoformat-on-save",
				bang = true,
			})

			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {
				desc = "Re-enable autoformat-on-save",
			})
		end,
	},
}
