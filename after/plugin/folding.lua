-- ~/.config/nvim/after/plugin/folding.lua

-- Keep folds clean
vim.opt.fillchars = { fold = " " }

function _G.MyFoldText()
    local first = vim.fn.getline(vim.v.foldstart)
    local last  = vim.fn.getline(vim.v.foldend)
    first       = vim.trim(first)
    last        = vim.trim(last)
    first       = first:gsub("{%s*$", "")
    if last:match("^}%s*$") or last:match("}$") then
        return first .. " { ... }"
    end
    return first .. " ..."
end

vim.opt.foldtext = "v:lua.MyFoldText()"

-- Save folds automatically, but only for buffers with a name
vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*",
    callback = function()
        if vim.fn.expand("%") ~= "" then
            vim.cmd("mkview")
        end
    end,
})

-- Load folds automatically
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        if vim.fn.expand("%") ~= "" then
            vim.cmd("silent! loadview")
        end
    end,
})
