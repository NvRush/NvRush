local telescope = require("telescope")

telescope.setup({
    defaults = {
        layout_strategy = "vertical",
        layout_config = { vertical = { width = 0.5, height = 0.4, preview_cutoff = 1 } },
        results_title = false,
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        file_ignore_patterns = { "node_modules", ".git/", "__pycache__", "%.lock" },
        path_display = { "truncate" },
        winblend = 0,
        previewer = false,
        mappings = {
            i = { ["<leader>fp"] = require("telescope.actions.layout").toggle_preview },
            n = { ["<leader>fp"] = require("telescope.actions.layout").toggle_preview },
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            cwd = vim.fn.expand("~"),
        },
        buffers = {
            sort_mru = true,
            ignore_current_buffer = true,
        },
    },
    extensions = {
        file_browser = {
            path = vim.fn.expand("~"),
            hidden = true,
            grouped = true,
            respect_gitignore = false,
            hijack_netrw = true,
            previewer = false,
        },
    },
})

telescope.load_extension("file_browser")

vim.keymap.set("n", "<leader>fff", "<cmd>Telescope file_browser path=~<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

local wk = require('which-key')
wk.add({
    { "<leader>f",  name = "Find" },
    { "<leader>ff", "<cmd>lua require('snacks').picker.files()<CR>", desc = "Files" },
    { "<leader>fg", "<cmd>lua require('snacks').picker.grep()<CR>",  desc = "Grep" },
    -- more mappings ...
})
