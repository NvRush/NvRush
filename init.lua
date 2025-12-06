-- ============================
-- Neovim Init File
-- ============================

-- ----------------------------
-- Safe Require Helper
-- ----------------------------
local function safe_require(module)
    local ok, result = pcall(require, module)
    if not ok then
        vim.notify(
            "Failed to load: " .. module .. "\n" .. tostring(result),
            vim.log.levels.ERROR,
            { title = "Module Load Error" }
        )
        return nil
    end
    return result
end

-- ============= ============= ============= =============
-- Colorschemes
-- ============= ============= ============= =============



-- ============= ============= ============= =============
-- 1. BASIC SETTINGS CORE
-- ============= ============= ============= =============
safe_require("user.UI.NoMoreItalics")
safe_require("user.System.env")
safe_require("user.System.options")
safe_require("user.System.mappings")
safe_require("user.System.autoreload")
safe_require("user.System.plugins")
safe_require("user.System.utilities")
safe_require("user.System.mason")

-- ============= ============= ============= =============
--  2. UI CORE (Overridden)
-- ============= ============= ============= =============

safe_require("user.UI.custom_treesitters")
safe_require("user.UI.dashboard")
safe_require("user.UI.DAP_UI")
safe_require("user.UI.diagonasticsigns")
safe_require("user.UI.IBL")
safe_require("user.UI.bufferline")
safe_require("user.UI.gitsigns")
safe_require("user.UI.statusline")
safe_require("user.UI.dressing")
safe_require("user.UI.windows")
-- safe_require("user.UI.snacks") backup only for mini.notify
-- safe_require("user.UI.bold_text")
safe_require("user.Overridder.Caller")
safe_require("user.Overridder.gruvbox_ts")
safe_require("user.UI.theme")
safe_require("user.UI.colors")
safe_require("user.UI.SetGlobalTheme")
safe_require("user.UI.notify")
safe_require("user.UI.ascii")

-- ============= ============= ============= =============
-- 3. Mini Ecosystem
-- ============= ============= ============= =============
safe_require("user.Mini.mini_surround")
safe_require("user.Mini.mini_notify")
safe_require("user.Mini.mini_icons")
safe_require("user.Mini.mini_animate")
safe_require("user.Mini.mini_jump")


-- ============= ============= ============= =============
-- 4. LspConfig Setup
-- ============= ============= ============= =============

-- HighLevel
safe_require("user.config.LspConfig.HighLevel.lua_ls")
safe_require("user.config.LspConfig.HighLevel.pyright")

-- LowLevel
safe_require("user.config.LspConfig.LowLevel.asm")
safe_require("user.config.LspConfig.LowLevel.clang")
safe_require("user.config.LspConfig.LowLevel.cmake")
safe_require("user.config.LspConfig.LowLevel.rust_analyzer")
safe_require("user.config.LspConfig.LowLevel.zls")

-- Productive
safe_require("user.config.LspConfig.Productive.bash_ls")
safe_require("user.config.LspConfig.Productive.marksman")
safe_require("user.config.LspConfig.Productive.vimls")

-- Utilities
safe_require("user.config.LspConfig.Utilities.dockerls")
safe_require("user.config.LspConfig.Utilities.jsonls")
safe_require("user.config.LspConfig.Utilities.yamlls")

-- Web
safe_require("user.config.LspConfig.Web.css_ls")
safe_require("user.config.LspConfig.Web.gopls")
safe_require("user.config.LspConfig.Web.html")
safe_require("user.config.LspConfig.Web.phpactor")
safe_require("user.config.LspConfig.Web.vtsls")

-- Activate Them all --
safe_require("user.config.LspBatch.lsp")
-- ============= ============= ============= =============
-- 5. LspBatch Setup
-- ============= ============= ============= =============
safe_require("user.config.LspBatch.lsp_lines")
safe_require("user.config.LspBatch.cmp") -- Comment this for blink completion

--[[
safe_require("user.config.LspBatch.cmd_cmp")  -- Comment this if using nvim completion
safe_require("user.config.LspBatch.blinkCmp") -- Comment this if using nvim completion
--]]

safe_require("user.config.LspBatch.autopairs")
safe_require("user.config.LspBatch.formatter")
safe_require("user.config.LspBatch.luasnip")
safe_require("user.config.LspBatch.lspkind")
safe_require("user.config.LspBatch.navic")

-- ============= ============= ============= =============
-- 5. LspBatch Setup
-- ============= ============= ============= =============

safe_require("user.config.IdeBatch.auto_save")
safe_require("user.config.IdeBatch.code_runner_on_click")
safe_require("user.config.IdeBatch.nvimtree")
safe_require("user.config.IdeBatch.telescope")
safe_require("user.config.IdeBatch.toggleterm")
safe_require("user.config.IdeBatch.project")
safe_require("user.config.IdeBatch.sessions")
safe_require("user.config.LspBatch.trouble")
safe_require("user.config.IdeBatch.harpoon")
safe_require("user.config.IdeBatch.snipe")
safe_require("user.config.IdeBatch.todo")
safe_require("user.config.IdeBatch.sessions")
safe_require("user.config.IdeBatch.whkey")
safe_require("user.config.IdeBatch.multiselect")
safe_require("user.config.IdeBatch.treesitter")
safe_require("user.config.IdeBatch.showkey")
safe_require("user.config.IdeBatch.surround")
safe_require("user.config.IdeBatch.arrow")
safe_require("user.config.IdeBatch.comments")
safe_require("user.config.IdeBatch.lazygit")
safe_require("user.config.IdeBatch.flash")
safe_require("user.config.IdeBatch.undotree")
safe_require("user.config.IdeBatch.yanky")
safe_require("user.config.IdeBatch.oil")

-- ============= ============= ============= =============
-- 4. PluginExtensionConfiguration
-- ============= ============= ============= =============
safe_require("user.PluginExtensionConfiguration.overseer")


-- ============= ============= ============= =============
-- 6. Custom Cmp
-- ============= ============= ============= =============

-- NOTE: IS CURRENTLY IN NON-PRODUCTION READY BUT WORKING STATE !

-- safe_require("user.CustomCmp.cmp-gd")


-- ============= ============= ============= ============= =============
-- Load the colorscheme at last !
-- ============= ============= ============= ============= =============
-- NOTE: SGT colorsheme_name will override
vim.cmd.colorscheme("gruvbox")
