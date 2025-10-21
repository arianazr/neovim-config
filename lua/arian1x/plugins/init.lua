return {
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
        },
    },
    -- Color scheme
    { "rose-pine/neovim",                       name = "rose-pine" },
    -- { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        commit = "v0.9.2",
    },
    -- Treesitter Context
    { "nvim-treesitter/nvim-treesitter-context" },
    -- Undoo Tree

    { "mbbill/undotree" },

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Git Integration
    { "tpope/vim-fugitive" },
    -- Lsp
    { "neovim/nvim-lspconfig" },
    {
        "williamboman/mason.nvim",
        version = "^1.0.0",
        opts = {},
    },
    -- Rust
    {
        'simrat39/rust-tools.nvim'
    },
    {
        "williamboman/mason-lspconfig.nvim",
        version = "^1.0.0",
        dependencies = { "neovim/nvim-lspconfig", "mason.nvim" },
        opts = { ensure_installed = { "lua_ls", "rust_analyzer" } },
    },
    -- Flutter
    {
        "nvim-flutter/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", -- optional for vim.ui.select
        }
    },
    -- AutoPairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    -- Auto completion
    {
        'saghen/blink.cmp',

        version = '1.*',
    },
    -- Lua Snippets
    -- {
    -- "L3MON4D3/LuaSnip",
    --  dependencies = { "rafamadriz/friendly-snippets" },
    -- },
    -- Better Floding
    {
        'anuvyklack/pretty-fold.nvim'
    },
    -- Surround
    {
        "tpope/vim-surround"
    },
    -- Lua Line(Status bar)
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
}
