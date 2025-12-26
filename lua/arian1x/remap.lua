vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Being able to move pieces of code up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- faster jumping upand down and keeping the cursor in place
vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")

-- Paste over the selected text whatever is in the yank buffer
vim.keymap.set("x", "<leader>p", "\"_dP")
-- Delete into the void (dont save into yank buffer)
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("n", "x", "\"_x")

-- Source current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Copy into text in the copy paste buffer
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
