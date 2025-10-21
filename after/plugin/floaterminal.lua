local function open_floating_terminal()
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_open_win(buf, true, {
        style = "minimal",
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        border = "rounded",
    })

    -- Determine directory
    local dir
    if vim.fn.expand("%:p") ~= "" then
        dir = vim.fn.expand("%:p:h")
    else
        local last = vim.fn.bufnr("#")
        if last ~= -1 and vim.fn.expand("#:p") ~= "" then
            dir = vim.fn.expand("#:p:h")
        else
            dir = vim.fn.getcwd()
        end
    end

    -- Open terminal
    vim.fn.termopen(vim.o.shell)

    -- Force terminal to the correct directory (without saving to history)
    local term_id = vim.b.terminal_job_id
    if term_id then
        -- Disable history, run cd and clear, then re-enable history
        vim.fn.chansend(term_id, " cd " .. dir .. "\n")
        vim.fn.chansend(term_id, " clear\n")
    end

    vim.cmd("startinsert")

    -- Close on <Esc>
    vim.api.nvim_buf_set_keymap(buf, "t", "<Esc>", "<Cmd>close<CR>", { noremap = true, silent = true })
end

vim.keymap.set("n", "<leader>tt", open_floating_terminal, { desc = "Floating Terminal" })
