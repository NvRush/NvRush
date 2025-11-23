-- =====================
-- Enhanced Gruvbox Notify Setup
-- =====================
local notify = require("notify")

-- Helper: adaptive timeout (based on message length)
local function adaptive_timeout(msg)
    local base = 2000     -- minimum 2s
    local extra = #msg * 40 -- add 40ms per character
    local max = 6000      -- cap at 6s
    return math.min(base + extra, max)
end

notify.setup({
    -- Default fallback timeout
    timeout = 4000,

    -- Smooth Gruvbox animation
    stages = "static",

    -- Logging level
    level = vim.log.levels.INFO,

    -- Responsive sizing
    max_width = math.floor(vim.o.columns * 0.75),
    max_height = math.floor(vim.o.lines * 0.6),

    -- Rendering style
    render = "simple",
})

-- Override vim.notify
vim.notify = function(msg, level, opts)
    opts = opts or {}

    -- Adaptive timing
    if not opts.timeout and level ~= vim.log.levels.ERROR then
        opts.timeout = adaptive_timeout(tostring(msg))
    end

    -- Errors stay until dismissed
    if level == vim.log.levels.ERROR then
        opts.timeout = false
    end

    notify(msg, level, opts)
end
