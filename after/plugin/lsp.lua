-- Mason setup
require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "clangd", "gopls" },
    automatic_installation = true,
})

-- Blink completion capabilities
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Blink setup
require("blink.cmp").setup({
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "mono" },
    completion = {
        documentation = { auto_show = false },
        menu = {
            border = "rounded",
            scrollbar = false,
        },
        ghost_text = { enabled = true },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
})


-- on_attach shared for all servers
local on_attach = function(client, bufnr)
    local km = vim.keymap.set
    local opts = { buffer = bufnr, silent = true }

    -- Basic LSP keymaps
    km("n", "ga", vim.lsp.buf.code_action, opts)
    km("n", "gd", vim.lsp.buf.definition, opts)
    km("n", "gr", vim.lsp.buf.rename, opts)
    km("n", "gt", vim.lsp.buf.type_definition, opts)
    km("n", "gh", vim.lsp.buf.signature_help, opts)

    local builtin = require("telescope.builtin")
    km("n", "<leader>gp", builtin.lsp_references, { desc = "LSP References" })
    km("n", "<leader>gi", builtin.lsp_implementations, { desc = "LSP Implementations" })

    -- Format on save if supported
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end
end

-- Default handler for all Mason-installed servers
require("mason-lspconfig").setup_handlers({
    function(server)
        vim.lsp.config(server, {
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable(server)
    end,

    -- Lua LS override
    ["lua_ls"] = function()
        vim.lsp.config("lua_ls", {
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
        vim.lsp.enable("lua_ls")
    end,

    -- Rust Analyzer override
    ["rust_analyzer"] = function()
        vim.lsp.config("rust_analyzer", {
            capabilities = capabilities,
            on_attach = on_attach,
            flags = {
                allow_incremental_sync = false,
            },
            settings = {
                ["rust-analyzer"] = {
                    cargo = { allFeatures = true },
                    procMacro = { enable = true },
                },
            },
        })
        vim.lsp.enable("rust_analyzer")
    end,
})
