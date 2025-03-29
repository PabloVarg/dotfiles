local Terminal = {
	default_width_p = 0,
	default_height_p = 0,
	curr_width_p = 0,
	curr_height_p = 0,
	min_width = 0,
	buf = -1,
	win = -1,
	chan = -1,
}

function Terminal:calculate_dimensions()
	local width = math.max(math.floor(vim.o.columns * self.curr_width_p), 100)
	local height = math.floor(vim.o.lines * self.curr_height_p)

	return {
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
	}
end

function Terminal:toggle(opts)
	opts = opts or {}

	if vim.api.nvim_win_is_valid(self.win) then
		vim.api.nvim_win_hide(self.win)
		return
	end

	self.curr_width_p = opts.width_percentage or self.default_width_p
	self.curr_height_p = opts.height_percentage or self.default_height_p

	local dims = self:calculate_dimensions()
	local win_opts = {
		relative = "editor",
		style = "minimal",
		border = "rounded",
		col = dims.col,
		row = dims.row,
		width = dims.width,
		height = dims.height,
	}

	local buf = self.buf
	if not vim.api.nvim_buf_is_valid(buf) then
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win = vim.api.nvim_open_win(buf, true, win_opts)
	vim.wo[win].winhighlight = "Normal:Normal,FloatBorder:Normal"
	if vim.bo.buftype ~= "terminal" then
		vim.cmd.terminal()
	end

	vim.api.nvim_command("startinsert")

	self.buf = buf
	self.win = win
	self.chan = vim.bo.channel
end

function Terminal:setup(opts)
	opts = opts or {}

	self.min_width = opts.min_width or 100
	self.default_width_p = opts.width_percentage or 0.5
	self.default_height_p = opts.height_percentage or 0.5
end

function Terminal:send(opts)
	opts = opts or {}

	if not vim.api.nvim_win_is_valid(self.win) then
		self:toggle()
	end
	local cmd = opts.cmd or ""

	vim.api.nvim_chan_send(self.chan, cmd .. "\n")
end

vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = vim.api.nvim_create_augroup("floaterm", { clear = true }),
	callback = function()
		if not vim.api.nvim_win_is_valid(Terminal.win) then
			return
		end

		local dims = Terminal:calculate_dimensions()
		vim.api.nvim_win_set_config(Terminal.win, {
			relative = "editor",
			style = "minimal",
			border = "double",
			col = dims.col,
			row = dims.row,
			width = dims.width,
			height = dims.height,
		})
	end,
})

return Terminal
