return {
	{
		"saghen/blink.cmp",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
				dependencies = { "rafamadriz/friendly-snippets" },
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "none",
				["<up>"] = { "select_prev", "fallback" },
				["<down>"] = { "select_next", "fallback" },
				["<C-k>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				["<Tab>"] = { "accept", "fallback" },
				["<F4>"] = { "snippet_forward", "fallback" },
				["<S-F4>"] = { "snippet_backward", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},

			signature = {
				enabled = true,
				window = {
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:Normal",
				},
			},

			appearance = {
				nerd_font_variant = "mono",
				kind_icons = {
					Text = "¶",
					Method = "m",
					Function = "ƒ",
					Constructor = "κ",
					Field = ".",
					Variable = "𝑣",
					Class = "ℂ",
					Interface = "𝙄",
					Module = "Μ",
					Property = "⌘",
					Unit = "∘",
					Value = "≡",
					Enum = "∷",
					Keyword = "🔑",
					Snippet = "ζ",
					Color = "⬤",
					File = "📄",
					Reference = "§",
					Folder = "📂",
					EnumMember = "∴",
					Constant = "π",
					Struct = "▦",
					Event = "★",
					Operator = "∑",
					TypeParameter = "τ",
				},
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = {
				list = {
					selection = {
						auto_insert = false,
					},
				},
				documentation = {
					auto_show = true,
					window = {
						border = "rounded",
						winhighlight = "Normal:Normal,FloatBorder:Normal",
					},
				},
				menu = {
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:Normal",
					draw = {
						columns = {
							{ "kind_icon", "label", "label_description", "source_id", gap = 1 },
						},
						treesitter = {
							"lsp",
						},
					},
				},
			},

			cmdline = {
				completion = {
					menu = {
						auto_show = true,
					},
				},
				keymap = {
					preset = "inherit",
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					sql = { "snippets", "dadbod", "buffer" },
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
					snippets = {
						score_offset = -50,
					},
					buffer = {
						score_offset = -100,
					},
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
					path = {
						opts = {
							get_cwd = function()
								return vim.fn.getcwd()
							end,
						},
					},
				},
			},

			snippets = {
				preset = "luasnip",
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = {
				implementation = "prefer_rust_with_warning",
				sorts = {
					"exact",
					-- defaults
					"score",
					"sort_text",
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
