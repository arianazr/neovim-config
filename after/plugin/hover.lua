require('hover').config({
    --- List of modules names to load as providers.
    --- @type (string|Hover.Config.Provider)[]
    providers = {
        'hover.providers.diagnostic',
        'hover.providers.lsp',
        'hover.providers.dap',
        'hover.providers.man',
        'hover.providers.dictionary',
        -- Optional, disabled by default:
        -- 'hover.providers.gh',
        -- 'hover.providers.gh_user',
        -- 'hover.providers.jira',
        -- 'hover.providers.fold_preview',
        -- 'hover.providers.highlight',
    },
    preview_opts = {
        border = 'rounded'
    },
    -- Whether the contents of a currently open hover window should be moved
    -- to a :h preview-window when pressing the hover keymap.
    preview_window = false,
    title = true,
    mouse_providers = {
        'hover.providers.lsp',
    },
    mouse_delay = 1000
})

-- Setup keymaps
vim.keymap.set('n', 'K', function()
    require('hover').open()
end, { desc = 'hover.nvim (open)' })

vim.keymap.set('n', 'gK', function()
    require('hover').enter()
end, { desc = 'hover.nvim (enter)' })

vim.keymap.set('n', '<C-p>', function()
    require('hover').switch('previous')
end, { desc = 'hover.nvim (previous source)' })

vim.keymap.set('n', '<C-n>', function()
    require('hover').switch('next')
end, { desc = 'hover.nvim (next source)' })

vim.o.mousemoveevent = false
-- Transparent hover highlights

-- Transparent hover-related highlights
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "HoverWindow", { bg = "none" })
vim.api.nvim_set_hl(0, "HoverBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "HoverSourceLine", { bg = "none" })
vim.api.nvim_set_hl(0, "HoverActiveSource", { bg = "none" })
vim.api.nvim_set_hl(0, "HoverInactiveSource", { bg = "none" })
vim.api.nvim_set_hl(0, "HoverFloatingError", { bg = "none" })
vim.api.nvim_set_hl(0, "HoverFloatingWarn", { bg = "none" })
vim.api.nvim_set_hl(0, "HoverFloatingInfo", { bg = "none" })
vim.api.nvim_set_hl(0, "HoverFloatingHint", { bg = "none" })
-- Example: bright blue border
vim.api.nvim_set_hl(0, "HoverBorder", { fg = "#D7DBE5" })
-- Optional fallback for other floats
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#D7DBE5" })
