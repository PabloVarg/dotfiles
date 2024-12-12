local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local sorters = require("telescope.sorters")
local conf = require("telescope.config").values

local M = {}

M.multigrep = function(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.uv.cwd()
	opts.sep = opts.sep or "  "

	local finder = finders.new_async_job({
		command_generator = function(prompt)
			if not prompt or prompt == "" then
				return nil
			end

			local pieces = vim.split(prompt, opts.sep)
			local args = { "rg" }

			if pieces[1] then
				table.insert(args, "-e")
				table.insert(args, pieces[1])
			end

			if pieces[2] then
				table.insert(args, "-g")
				table.insert(args, pieces[2])
			end

			table.insert(args, "--color=never")
			table.insert(args, "--no-heading")
			table.insert(args, "--with-filename")
			table.insert(args, "--line-number")
			table.insert(args, "--column")
			table.insert(args, "--smart-case")

			return args
		end,
		entry_maker = make_entry.gen_from_vimgrep(opts),
		cwd = opts.cwd,
	})

	pickers
		.new(opts, {
			prompt_title = "Live Grep with ft",
			debounce = 100,
			finder = finder,
			previewer = conf.grep_previewer(opts),
			sorter = sorters.empty(),
		})
		:find()
end

return M
