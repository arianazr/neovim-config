require("arian1x.remap")
-- 1️⃣ Load lazy.nvim and plugins first
require("arian1x.lazy")

-- 2️⃣ Load plugin configs (blink, colors, etc.)
require("arian1x.plugins")


-- 4️⃣ Load other configs

-- Searching
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.opt.viewoptions:remove("options")


-- Indentation
vim.o.smartindent = true
-- Syntax Highlighting (enabled by default in Lua)
vim.cmd("syntax on")

-- Line formatting
vim.wo.relativenumber = true
vim.wo.number = true
-- Telescope Transparency
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })

-- Tabs and spaces
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50


-- Tree-sitter folding setup
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- Optional: open all folds by default
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
