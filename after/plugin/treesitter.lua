require("nvim-treesitter").setup({})

require("nvim-treesitter").install({
    "lua", "vim", "vimdoc", "query",
    "markdown", "markdown_inline",
    "c_sharp", "php", "html", "javascript",
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
