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
    local dir = vim.fn.getcwd()
    if vim.fn.expand("%:p") ~= "" then
        dir = vim.fn.expand("%:p:h")
    elseif vim.fn.bufnr("#") ~= -1 and vim.fn.expand("#:p") ~= "" then
        dir = vim.fn.expand("#:p:h")
    end

    -- Use login shell to ensure .bashrc/.zshrc is sourced
    local shell = vim.o.shell
    local cmd
    if shell:find("zsh") then
        cmd = { shell, "--login" } -- zsh --login sources .zprofile, .zshrc
    elseif shell:find("bash") then
        cmd = { shell, "--login" } -- bash --login sources .bash_profile or .bashrc
    else
        cmd = { shell }            -- fallback
    end

    -- Start terminal with explicit command
    vim.fn.termopen(cmd, {
        cwd = dir, -- Set working directory directly!
        on_exit = function()
            -- Optional: clean up if needed
        end,
    })

    -- No need to manually send 'cd' — cwd is already set
    -- But we can still clear the screen

    vim.cmd("startinsert")

    -- Close on <Esc> in terminal mode
    vim.api.nvim_buf_set_keymap(buf, "t", "<Esc>", "<Cmd>close<CR>", { noremap = true, silent = true })
end

vim.keymap.set("n", "<leader>t", open_floating_terminal, { desc = "Floating Terminal" })
