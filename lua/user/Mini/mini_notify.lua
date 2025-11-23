-- Disable animations
vim.g.mininotify_disable = false

require('mini.notify').setup({
    window = {
        config = {
            border = "rounded",
            row = 0,
            col = 0,
            -- Use anchor to position notifications:
            -- "NW" = top-left (row 0, col 0)
            -- "NE" = top-right (row 0, col vim.o.columns)
            -- "SW" = bottom-left (row vim.o.lines, col 0)
            -- "SE" = bottom-right (row vim.o.lines, col vim.o.columns)
            anchor = "SE",
        },
    },
})

vim.notify = require('mini.notify').make_notify()

-- Examples of different positions:

-- Top-right corner:
-- anchor = "NE", row = 0, col = vim.o.columns

-- Bottom-left corner:
-- anchor = "SW", row = vim.o.lines, col = 0

-- Bottom-right corner:
-- anchor = "SE", row = vim.o.lines, col = vim.o.columns

-- Center of screen:
-- anchor = "NW", row = math.floor(vim.o.lines / 2), col = math.floor(vim.o.columns / 2)


-- require('mini.notify').setup({
--     window = {
--         config = {
--             border = "none",
--             row = 0,
--             col = 0,
--         },
--     },
-- })
--
-- vim.notify = require('mini.notify').make_notify()
