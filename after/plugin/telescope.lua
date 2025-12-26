local telescope = require("telescope")

telescope.setup({
    defaults = {
        selection_caret = "->",
        winblend = 0,
    },
    extensions = {
        fzf = {},
    },
})

pcall(function()
    telescope.load_extension("fzf")
end)



vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#C6A15B", bold = true })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "none", fg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#B0B0B0" })

local keymap = vim.keymap.set
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find fIles" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Grepin'" })
