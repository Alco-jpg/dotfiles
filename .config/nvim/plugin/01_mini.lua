-- ~/.config/nvim/plugin/01_mini.lua

-- Initializes the native icon provider for subsequent UI plugins.
require('mini.icons').setup()

-- Enhances native textobjects for advanced semantic selections.
require('mini.ai').setup({ n_lines = 50 })

-- Activates abstract surround editing actions.
require('mini.surround').setup()

-- Deploys the dynamically adapting minimalistic statusline.
require('mini.statusline').setup()

-- Instantiates the Miller column filesystem explorer.
require('mini.files').setup({
    mappings = {
        close       = 'q',
        go_in       = 'l',
        go_in_plus  = 'L',
        go_out      = 'h',
        go_out_plus = 'H',
    },
    windows = {
        preview = true, -- Enables opt-in file preview pane logic.
    }
})

-- Establishes a keymap to toggle the filesystem explorer interactively.
vim.keymap.set("n", "<leader>pv", function() require("mini.files").open() end, { desc = "Open Mini Files" })

-- Instantiates the high-performance fuzzy picker.
require('mini.pick').setup()
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Pick grep_live<CR>", { desc = "Live Grep" })
