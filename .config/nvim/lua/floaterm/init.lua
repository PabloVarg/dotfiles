local Terminal = {
	buf = -1,
	win = -1,
}

function Terminal:toggle(width_percentage, height_percentage)
	if vim.api.nvim_win_is_valid(self.win) then
		vim.api.nvim_win_hide(self.win)
		return
	end

	local width = math.floor(vim.o.columns * width_percentage)
	local height = math.floor(vim.o.lines * height_percentage)
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)
	local opts = {
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

	local win = vim.api.nvim_open_win(buf, true, opts)
	vim.wo[win].winhighlight = "Normal:Normal,FloatBorder:Normal"
	if vim.bo.buftype ~= "terminal" then
		vim.cmd.terminal()
	end

	vim.api.nvim_command("startinsert")

	self.buf = buf
	self.win = win
end

return Terminal
