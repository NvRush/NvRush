-- snacks.nvim configuration for fast, bottom-left notifications
-- with beautiful picker using current active theme

require("snacks").setup({
    notifier = {
        enabled = true,
        timeout = 3000,                              -- 3 seconds display time
        width = { min = 40, max = 0.4 },             -- max 40% of screen width
        height = { min = 1, max = 0.6 },             -- max 60% of screen height
        margin = { top = 0, right = 1, bottom = 0 }, -- position margins
        padding = 1,
        sort = { "level", "added" },

        -- Position: bottom-left corner
        style = "compact",
        top_down = false, -- stack from bottom up

        -- Window options for the notification buffer
        win = {
            relative = "editor",
            position = "bottom",
            anchor = "SW", -- South-West (bottom-left)
            width = 60,
            height = 1,
            row = -2, -- 2 lines from bottom
            col = 0,  -- left edge
            border = "rounded",

            -- Enable line wrapping
            wo = {
                wrap = true,
                linebreak = true,
                breakindent = true,
                showbreak = "↪ ",
            },

            -- Use current theme colors dynamically
            style = function()
                local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
                local float = vim.api.nvim_get_hl(0, { name = "NormalFloat" })
                local border = vim.api.nvim_get_hl(0, { name = "FloatBorder" })

                return {
                    bg = float.bg or normal.bg,
                    fg = float.fg or normal.fg,
                    border_fg = border.fg,
                    border_bg = float.bg or normal.bg,
                }
            end,
        },

        -- No animations for instant display
        stages = {
            {
                timeout = 0,
                hl = function()
                    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
                    return { bg = normal.bg, fg = normal.fg }
                end,
            },
        },

        -- Level-specific highlighting using theme colors
        level = {
            trace = {
                hl = function()
                    local comment = vim.api.nvim_get_hl(0, { name = "Comment" })
                    return { fg = comment.fg }
                end,
                icon = "●",
            },
            debug = {
                hl = function()
                    local special = vim.api.nvim_get_hl(0, { name = "Special" })
                    return { fg = special.fg }
                end,
                icon = "◆",
            },
            info = {
                hl = function()
                    local info = vim.api.nvim_get_hl(0, { name = "DiagnosticInfo" })
                    return { fg = info.fg }
                end,
                icon = "●",
            },
            warn = {
                hl = function()
                    local warn = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn" })
                    return { fg = warn.fg }
                end,
                icon = "▲",
            },
            error = {
                hl = function()
                    local error = vim.api.nvim_get_hl(0, { name = "DiagnosticError" })
                    return { fg = error.fg }
                end,
                icon = "✖",
            },
        },

        -- Icons configuration
        icons = {
            enabled = true,
        },
    },

    -- Beautiful Picker Configuration
    picker = {
        enabled = false,

        -- Layout configuration
        layout = {
            preset = "telescope", -- bottom-up layout (also try: "default", "telescope")
            width = 0.8,          -- 80% of screen width
            height = 0.6,         -- 60% of screen height
            border = "rounded",
            backdrop = 60,        -- backdrop transparency (0-100)

            -- Position in center-bottom
            position = "bottom",
            row = 0.9, -- near bottom
        },

        -- Window style using theme colors
        win = {
            input = {
                border = "rounded",
                title_pos = "center",
                style = function()
                    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
                    local float = vim.api.nvim_get_hl(0, { name = "NormalFloat" })
                    local border = vim.api.nvim_get_hl(0, { name = "FloatBorder" })
                    local title = vim.api.nvim_get_hl(0, { name = "FloatTitle" })

                    return {
                        bg = float.bg or normal.bg,
                        fg = float.fg or normal.fg,
                        border_fg = border.fg,
                        title_fg = title.fg or border.fg,
                    }
                end,
            },
            list = {
                border = "rounded",
                style = function()
                    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
                    local float = vim.api.nvim_get_hl(0, { name = "NormalFloat" })
                    local border = vim.api.nvim_get_hl(0, { name = "FloatBorder" })

                    return {
                        bg = float.bg or normal.bg,
                        fg = float.fg or normal.fg,
                        border_fg = border.fg,
                    }
                end,
            },
        },

        -- Formatting and icons
        formatters = {
            file = {
                filename_first = true, -- show filename before path
                -- Icons using theme highlight groups
                format = function(item)
                    local path = item.text
                    local icon = item.icon or ""
                    return string.format("%s %s", icon, path)
                end,
            },
        },

        -- Preview window configuration
        preview = {
            enabled = true,
            border = "rounded",
            style = function()
                local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
                local float = vim.api.nvim_get_hl(0, { name = "NormalFloat" })
                local border = vim.api.nvim_get_hl(0, { name = "FloatBorder" })

                return {
                    bg = float.bg or normal.bg,
                    fg = float.fg or normal.fg,
                    border_fg = border.fg,
                }
            end,
        },

        -- Icons configuration
        icons = {
            enabled = true,
        },

        -- Matcher configuration for fuzzy finding
        matcher = {
            frecency = true, -- enable frecency sorting
            filename_first = true,
        },

        -- Sources configuration with icons
        sources = {
            files = {
                hidden = false, -- don't show hidden files by default
                follow = true,  -- follow symlinks
            },
            grep = {
                hidden = false,
            },
        },
    },

    -- Custom highlight groups that inherit from theme
    styles = {
        notification = {
            wo = { wrap = true, linebreak = true },
        },

    },
})

-- Override vim.notify to use snacks
vim.notify = function(msg, level, opts)
    return require("snacks").notifier.notify(msg, level, opts)
end


-- Example usage:
-- :lua require("snacks").picker.files()
-- :lua require("snacks").picker.grep()
-- Or use the keymaps defined above
