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
    --  { "rebelot/kanagawa.nvim" },
    -- { 'shaunsingh/nord.nvim' },
    -- { "ewilazarus/preto" },
    {
        "blazkowolf/gruber-darker.nvim",
        opts = {
            bold = false,
            italic = {
                strings = false,
            },
        },
    },
    { "rose-pine/neovim",                       name = "rose-pine" },
    -- { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
    -- Cursor effect
    -- {
    --     "sphamba/smear-cursor.nvim",

    --     opts = {
    --         -- Smear cursor when switching buffers or windows.
    --         smear_between_buffers = true,

    --         -- Smear cursor when moving within line or to neighbor lines.
    --         -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
    --         smear_between_neighbor_lines = true,

    --         -- Draw the smear in buffer space instead of screen space when scrolling
    --         scroll_buffer_space = true,


    --         -- Smear cursor in insert mode.
    --         -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
    --         smear_insert_mode = true,
    --         cursor_color = "#F4B930",
    --         legacy_computing_symbols_support = true,
    --         transparent_bg_fallback_color = "#303030",
    --         stiffness = 0.8,                      -- 0.6      [0, 1]
    --         trailing_stiffness = 0.6,             -- 0.45     [0, 1]
    --         stiffness_insert_mode = 0.7,          -- 0.5      [0, 1]
    --         trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
    --         damping = 0.95,                       -- 0.85     [0, 1]
    --         damping_insert_mode = 0.95,           -- 0.9      [0, 1]
    --         distance_stop_animating = 0.5,        -- 0.1      > 0
    --     },
    -- },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
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
    -- {
    --     "rafamadriz/friendly-snippets",

    -- },
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
    -- Better Comments
    {
        "tpope/vim-commentary",
    },
    -- Lsp Hover configuration
    {
        "lewis6991/hover.nvim",
    }
}
