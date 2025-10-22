require("noice").setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        cmdline_output_to_split = false, -- disable the split behavior
    },
    cmdline = {
        view = "cmdline",
        format = {
            cmdline = { icon = "", lang = "vim" },
            search_down = { icon = "searching down ->", lang = "regex" },
            search_up = { icon = "searching up ->", lang = "regex" },
            filter = { icon = "", lang = "bash" },
            lua = { icon = "", lang = "lua" },
            help = { icon = "󰘥" },
        },
    },
    views = {
        cmdline_output = {
            position = {
                row = "100%", -- bottom
                col = 0,      -- left edge
            },
            size = {
                width = "50%", -- optional: how wide the message area is
                height = "auto",
            },
            border = {
                style = "none", -- keep it minimal like Vim
            },
            win_options = {
                winblend = 0,
                winhighlight = {
                    Normal = "Normal",
                    FloatBorder = "FloatBorder",
                },
            },
        },
        popup = {
            backend = "popup",
            position = { row = "50%", col = "50%" },
            size = { width = 80, height = 20 },
            border = { style = "rounded" },
        },
        split = {
            enter = true, -- you can focus it if you want
            backend = "popup",
            position = {
                row = "50%",
                col = "50%",
            },
            size = {
                width = 80,
                height = 20,
            },
            border = {
                style = "rounded",
                highlight = "NoiceBorder",
            },
            win_options = {
                winblend = 10,
                winhighlight = {
                    Normal = "NormalFloat",
                    FloatBorder = "FloatBorder",
                },
            },
        },
    },
})
print("Hello from noice config")
