local Terminal = {
	default_width_p = 0,
	default_height_p = 0,
	min_width = 0,
	buf = -1,
	win = -1,
}

function Terminal:toggle(opts)
	opts = opts or {}

	if vim.api.nvim_win_is_valid(self.win) then
		vim.api.nvim_win_hide(self.win)
		return
	end

	local width_percentage = opts.width_percentage or self.default_width_p
	local height_percentage = opts.height_percentage or self.default_height_p

	local width = math.max(math.floor(vim.o.columns * width_percentage), 100)
	local height = math.floor(vim.o.lines * height_percentage)
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)
	local win_opts = {
		relative = "editor",
		col = col,
		row = row,
		width = width,
		height = height,
		style = "minimal",
		border = "single",
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
end

function Terminal:setup(opts)
	opts = opts or {}

	self.min_width = opts.min_width or 100
	self.default_width_p = opts.width_percentage or 0.5
	self.default_height_p = opts.height_percentage or 0.5
end
end

return Terminal
