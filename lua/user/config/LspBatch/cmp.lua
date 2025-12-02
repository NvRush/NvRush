local cmp = require('cmp')
local luasnip = require('luasnip')

-- 🌈 Modern, Beautiful, Bigger Icons (Nerd Font v3)
local kind_icons = {
    Text          = "",
    Method        = "",
    Function      = "󰈸",
    Constructor   = "",
    Field         = "󰈹",
    Variable      = "",
    Class         = "󰠖",
    Interface     = "󰍲",
    Module        = "",
    Property      = "󱍀",
    Unit          = "",
    Value         = "󱄑",
    Enum          = "󱃔",
    Keyword       = "󰌽",
    Snippet       = "󱥬",
    Color         = "󰢵",
    File          = "󰈙",
    Reference     = "",
    Folder        = "",
    EnumMember    = "",
    Constant      = "󰬌",
    Struct        = "",
    Event         = "󰃭",
    Operator      = "󰦓",
    TypeParameter = "󱃹",
}

-- ✨ Smart, compact, human-friendly labels
local kind_labels = {
    Text          = "txt",
    Method        = "meth",
    Function      = "fn",
    Constructor   = "contor",
    Field         = "field",
    Variable      = "var",
    Class         = "class",
    Interface     = "iFace",
    Module        = "mod",
    Property      = "propy",
    Unit          = "unit",
    Value         = "val",
    Enum          = "enum",
    Keyword       = "key",
    Snippet       = "snip",
    Color         = "color",
    File          = "file",
    Reference     = "ref",
    Folder        = "dir",
    EnumMember    = "e.mem",
    Constant      = "const.",
    Struct        = "struct",
    Event         = "eve",
    Operator      = "optr",
    TypeParameter = "tyPram",
}

cmp.setup({
    -- ❌ NO GHOST TEXT (banned forever!)
    experimental = {
        ghost_text = false,
    },

    -- 🎨 Completion Window Styling - 4 ITEMS FOR TEXT EDITOR
    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
            scrollbar = true,
            col_offset = -3,
            side_padding = 1,
        },
        documentation = cmp.config.disable,
    },

    -- 📋 Formatting (Icons + Short Labels + Abbreviations)
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], kind_labels[vim_item.kind])

            if #vim_item.abbr > 30 then
                vim_item.abbr = vim_item.abbr:sub(1, 27) .. "..."
            end

            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snip]",
                buffer = "[Buf]",
                path = "[Path]",
                nvim_lua = "[Lua]",
            })[entry.source.name]

            return vim_item
        end,
    },

    -- ⌨️ Snippet Engine
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    -- 🎯 Completion Sources
    sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'luasnip',  priority = 750 },
        { name = 'buffer',   priority = 500, keyword_length = 3 },
        { name = 'path',     priority = 250 },
    }),

    -- ⌨️ Keymaps for INSERT MODE (arrow keys + enter to select)
    mapping = cmp.mapping.preset.insert({
        -- Arrow keys for navigation
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

        -- Scroll through many items
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),

        -- ENTER or TAB to select and insert
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false
                })
            else
                fallback()
            end
        end, { 'i', 's' }),

        -- ESC or Ctrl+e to close
        ['<Esc>'] = cmp.mapping.abort(),
        ['<C-e>'] = cmp.mapping.abort(),

        -- Ctrl+Space to manually trigger
        ['<C-Space>'] = cmp.mapping.complete(),
    }),

    -- ⚡ Performance
    performance = {
        debounce = 60,
        throttle = 30,
        fetching_timeout = 500,
    },

    -- 🎯 Completion Behavior
    completion = {
        completeopt = 'menu,menuone,noselect',
        keyword_length = 1,
    },

    -- 🔍 Matching
    matching = {
        disallow_fuzzy_matching = false,
        disallow_partial_matching = false,
        disallow_prefix_unmatching = false,
    },
})

-- 📝 COMMAND-LINE COMPLETION - FIXED ENTER BEHAVIOR
cmp.setup.cmdline(':', {
    mapping = {
        -- Arrow keys to navigate WITHOUT auto-filling
        ['<Down>'] = { c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }) },
        ['<Up>'] = { c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }) },
        ['<C-n>'] = { c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }) },
        ['<C-p>'] = { c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }) },

        -- TAB to fill selected item into cmdline (does NOT execute)
        ['<Tab>'] = {
            c = function()
                if cmp.visible() then
                    cmp.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true
                    })
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', true)
                end
            end,
        },

        -- ENTER: if item selected, fill it; otherwise execute command immediately
        ['<CR>'] = {
            c = function()
                if cmp.visible() and cmp.get_selected_entry() then
                    -- Item is selected: insert it into cmdline
                    cmp.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = false
                    })
                else
                    -- No item selected or menu closed: execute command
                    cmp.abort()
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, true, true), 'n', true)
                end
            end,
        },

        -- ESC to close menu WITHOUT filling
        ['<C-e>'] = { c = cmp.mapping.abort() },
        ['<Esc>'] = { c = cmp.mapping.abort() },
    },
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' }
    }),
    window = {
        completion = {
            border = "rounded",
            scrollbar = true,
        },
    },
})

-- 📝 SEARCH COMPLETION - Same fix
cmp.setup.cmdline({ '/', '?' }, {
    mapping = {
        ['<Down>'] = {
            c = function()
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    cmp.complete()
                end
            end
        },
        ['<Up>'] = {
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    cmp.complete()
                end
            end
        },
        ['<Tab>'] = {
            c = function()
                if cmp.visible() then
                    cmp.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true
                    })
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', true)
                end
            end,
        },
        ['<CR>'] = {
            c = function()
                if cmp.visible() and cmp.get_selected_entry() then
                    -- Item is selected: insert it
                    cmp.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = false
                    })
                else
                    -- No item selected: execute search
                    cmp.abort()
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, true, true), 'n', true)
                end
            end,
        },
        ['<C-e>'] = { c = cmp.mapping.abort() },
        ['<Esc>'] = { c = cmp.mapping.abort() },
    },
    sources = {
        { name = 'buffer', keyword_length = 2 }
    },
    window = {
        completion = {
            border = "rounded",
            scrollbar = true,
        },
    },
    completion = {
        autocomplete = false,
    },
})

-- 🎨 Theme-Adaptive Highlights
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
        local normal_fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg

        vim.api.nvim_set_hl(0, "Pmenu", { bg = normal_bg, fg = normal_fg })
        vim.api.nvim_set_hl(0, "PmenuBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "PmenuSel", { link = "CursorLine" })
        vim.api.nvim_set_hl(0, "PmenuThumb", { link = "PmenuSbar" })

        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { link = "Search" })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "Search" })
        vim.api.nvim_set_hl(0, "CmpItemKindFunction", { link = "Function" })
        vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "Function" })
        vim.api.nvim_set_hl(0, "CmpItemKindVariable", { link = "Variable" })
        vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { link = "Keyword" })
        vim.api.nvim_set_hl(0, "CmpItemKindClass", { link = "Type" })
        vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "Type" })
        vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "String" })
        vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { link = "Special" })
    end,
})

vim.cmd("doautocmd ColorScheme")

-- 🔥 FORCE x Number of ITEMS IN EDITOR & IN CMDLINE
vim.opt.pumheight = 6 -- Default for insert mode (text editor)

-- Override for cmdline mode
vim.api.nvim_create_autocmd("CmdlineEnter", {
    callback = function()
        vim.opt.pumheight = 6 -- 5 items in command mode
    end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
    callback = function()
        vim.opt.pumheight = 6 -- Back to 4 items in editor
    end,
})
