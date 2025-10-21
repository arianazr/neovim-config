-- Mason and LSP config
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "clangd" },
    automatic_installation = true, -- <-- fill this
})

-- Get the default capabilities (Blink instead of cmp_nvim_lsp)
local capabilities = require("blink.cmp").get_lsp_capabilities()


-- Central on_attach for all LSPs
require("blink.cmp").setup({
    keymap = {
        preset = 'default',
    },

    appearance = {
        nerd_font_variant = 'mono'
    },

    completion = {
        documentation = { auto_show = false },
        menu = {
            border = "rounded",
            scrollbar = false,
        },
        ghost_text = {
            enabled = true
        }
    },
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`


    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
})

local on_attach = function(client, bufnr)
    local km = vim.keymap.set
    local opts = { buffer = bufnr, silent = true }

    -- Basic LSP keymaps
    km("n", "ga", vim.lsp.buf.code_action, opts)
    km("n", "gd", vim.lsp.buf.definition, opts)
    km("n", "K", vim.lsp.buf.hover, opts)
    km("n", "gr", vim.lsp.buf.rename, opts)
    km("n", "gt", vim.lsp.buf.type_definition, opts)
    local builtin = require("telescope.builtin")

    -- Keymaps with telescope
    vim.keymap.set("n", "<leader>gp", builtin.lsp_references, { desc = "LSP References" })
    vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "LSP Implementations" })



    -- Format on save if the server supports it
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end
end

-- Auto setup installed servers with overrides
require("mason-lspconfig").setup_handlers({
    -- Default handler for all servers
    function(server)
        require("lspconfig")[server].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,

    -- Lua LS override
    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    runtime = { version = "LuaJIT" },
                    telemetry = { enable = false },
                },
            },
        })
    end,

    -- Rust Analyzer override
    ["rust_analyzer"] = function()
        require("lspconfig").rust_analyzer.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            flags = {
                allow_incremental_sync = false, -- avoid invalid offsets
            },
            settings = {
                ["rust-analyzer"] = {
                    cargo = { allFeatures = true },
                    procMacro = { enable = true },
                },
            },
        })
    end,
})
