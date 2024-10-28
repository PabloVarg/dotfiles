vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "J", "mzJ'z")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "z;", "z=")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<leader>Q", ":q!<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>W", ":wa<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>x", ":x<CR>")
vim.keymap.set("n", "<leader>X", ":xa<CR>")
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==")
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })
vim.keymap.set("n", "<M-j>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<M-h>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<M-l>", ":vertical resize +2<CR>", { silent = true })
vim.keymap.set("n", "<M-k>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<Tab>", "<C-^>", { silent = true })
vim.keymap.set("n", "<leader>r", ":.,$s//gc<Left><Left><Left>")
vim.keymap.set("x", "<leader>r", [["0y:<C-u>.,$s/<C-r>0/<C-r>0/gc<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s", ":split<CR>", { silent = true })
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>zh", ":set hlsearch!<CR>")
vim.keymap.set("n", "<leader>zs", ":set spell!<CR>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set({ "n", "v" }, "<leader>D", '"_d')
vim.keymap.set("x", "p", '"_dP')
vim.keymap.set("x", "P", "p")
vim.keymap.set("o", "ae", ":<C-U>normal! VggoG<CR>", { silent = true })
vim.keymap.set("x", "ae", ":<C-U>normal! VggoG<CR>", { silent = true })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "tq", function()
	local qf_exists = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			qf_exists = true
		end
	end
	if qf_exists == true then
		vim.cmd("cclose")
		return
	end
	if not vim.tbl_isempty(vim.fn.getqflist()) then
		vim.cmd("copen")
	end
end)

vim.keymap.set("n", "<C-n>", function()
	local qf_exists = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			qf_exists = true
		end
	end
	if qf_exists == true then
		vim.cmd("cn")
		return
	end
end)

vim.keymap.set("n", "<C-p>", function()
	local qf_exists = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			qf_exists = true
		end
	end
	if qf_exists == true then
		vim.cmd("cp")
		return
	end
end)
