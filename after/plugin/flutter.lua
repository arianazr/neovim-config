local cmp_capabilities = require("blink.cmp").get_lsp_capabilities()

require("flutter-tools").setup({
    lsp = {
        capabilities = cmp_capabilities,
        on_attach = function(_, bufnr)
            local km = vim.keymap.set
            local opts = { buffer = bufnr, silent = true }

            -- Basic LSP keymaps
            km("n", "ga", vim.lsp.buf.code_action, opts)
            km("n", "gd", vim.lsp.buf.definition, opts)
            km("n", "K", vim.lsp.buf.hover, opts)
            km("n", "gr", vim.lsp.buf.rename, opts)

            -- Flutter-specific commands
            km("n", "<leader>fr", ":FlutterRun<CR>", opts)
            km("n", "<leader>fl", ":FlutterReload<CR>", opts)
            km("n", "<leader>fo", ":FlutterOutlineToggle<CR>", opts)
            km("n", "<leader>fd", ":FlutterDevices<CR>", opts)
            km("n", "<leader>lg", ":FlutterLogToggle<CR>", opts)
            km("n", "<leader>cl", ":FlutterLogClear<CR>", opts)
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end,
        settings = {
            showTodos = true,
            completeFunctionCalls = true,
        },
    },
    widget_guides = { enabled = true },
    closing_tags = { enabled = true },
    dev_log = { open_cmd = "tabedit" },
})
