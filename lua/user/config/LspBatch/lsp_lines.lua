require("lsp_lines").setup({
    virtual_lines = {
        only_current_line = true,
        highlight_whole_line = false,
    },
})

vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = {
        only_current_line = true,
    },
    severity_sort = true,
})

-- Floating window for diagnostics
local float_win = nil
local float_buf = nil

local function close_float()
    if float_win and vim.api.nvim_win_is_valid(float_win) then
        vim.api.nvim_win_close(float_win, true)
        float_win = nil
    end
end

local function show_diagnostics_float()
    close_float()

    local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
    if #diagnostics == 0 then return end

    local lines = {}
    for _, diag in ipairs(diagnostics) do
        local severity = vim.diagnostic.severity[diag.severity]
        table.insert(lines, string.format("%s: %s", severity:lower(), diag.message))
    end

    if #lines == 0 then return end

    -- Create buffer if it doesn't exist
    if not float_buf or not vim.api.nvim_buf_is_valid(float_buf) then
        float_buf = vim.api.nvim_create_buf(false, true)
    end

    vim.api.nvim_buf_set_lines(float_buf, 0, -1, false, lines)

    -- Calculate width and height
    local width = 0
    for _, line in ipairs(lines) do
        width = math.max(width, #line)
    end
    width = math.min(width, vim.o.columns - 4)

    local opts = {
        relative = "editor",
        width = width,
        height = #lines,
        row = vim.o.lines - #lines - 3,
        col = 0,
        style = "minimal",
        border = "rounded",
        focusable = false,
    }

    float_win = vim.api.nvim_open_win(float_buf, false, opts)
end

-- Show diagnostics float on cursor hold (normal mode)
vim.api.nvim_create_autocmd("CursorHold", {
    callback = show_diagnostics_float,
})

-- Show diagnostics float on cursor hold in insert mode
vim.api.nvim_create_autocmd("CursorHoldI", {
    callback = show_diagnostics_float,
})

-- Close float on cursor move
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    callback = close_float,
})

-- Reduce the delay before CursorHold triggers
vim.opt.updatetime = 500

-- Toggle lsp_lines with <leader>r
vim.keymap.set("n", "<leader>ri", function()
    local config = vim.diagnostic.config()
    if config.virtual_lines then
        vim.diagnostic.config({ virtual_lines = false })
    else
        vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
    end
end, { desc = "Toggle LSP lines diagnostics" })
