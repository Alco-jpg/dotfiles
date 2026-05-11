require('mini.icons').setup()
require('mini.ai').setup({ n_lines = 50 })
require('mini.surround').setup({
    mappings = {
        add            = 'ys',  -- ys<motion><char>  (ysiw" wraps word in quotes)
        delete         = 'ds',  -- ds<char>
        replace        = 'cs',  -- cs<old><new>
        find           = 'sf',
        find_left      = 'sF',
        highlight      = 'sh',
        update_n_lines = 'sn',
    },
})
require('mini.pairs').setup()
require('mini.comment').setup()
require('mini.diff').setup({
    view = {
        style = 'sign',
        signs = { add = '▎', change = '▎', delete = '' },
    },
})
require('mini.statusline').setup()

require('mini.indentscope').setup({
    symbol = '│',
    options = { try_as_border = true },
})

require('mini.files').setup({
    mappings = {
        close       = 'q',
        go_in       = 'l',
        go_in_plus  = 'L',
        go_out      = 'h',
        go_out_plus = 'H',
    },
    windows = { preview = true },
})

vim.keymap.set("n", "<leader>e", function()
    local mf = require('mini.files')
    if not mf.close() then mf.open() end
end, { desc = "Toggle file tree" })

vim.keymap.set("n", "<leader>E", function()
    local mf = require('mini.files')
    local path = vim.api.nvim_buf_get_name(0)
    mf.open(path ~= '' and path or vim.fn.getcwd())
end, { desc = "Open file tree at current file" })

vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesBufferCreate",
    callback = function(args)
        local buf = args.data.buf_id
        vim.keymap.set("n", "<space><space>", function()
            local entry = require('mini.files').get_fs_entry()
            local dir
            if entry then
                dir = entry.fs_type == 'directory' and entry.path or vim.fs.dirname(entry.path)
            else
                dir = vim.fn.getcwd()
            end
            require('mini.files').close()
            require('fzf-lua').grep_project({ cwd = dir })
        end, { buffer = buf, desc = "Fuzzy grep from hovered folder" })
    end,
})

require('mini.pick').setup({
    window = {
        config = function()
            local height = math.floor(vim.o.lines * 0.5)
            local width = math.floor(vim.o.columns * 0.6)
            return {
                anchor = 'NW',
                height = height,
                width = width,
                row = math.floor((vim.o.lines - height) / 2),
                col = math.floor((vim.o.columns - width) / 2),
            }
        end,
    },
})

vim.keymap.set("n", "<leader>sf", "<cmd>Pick files<CR>",      { desc = "Search files" })
vim.keymap.set("n", "<leader>sb", "<cmd>Pick buffers<CR>",    { desc = "Search buffers" })
vim.keymap.set("n", "<leader>sh", "<cmd>Pick help<CR>",       { desc = "Search help" })
vim.keymap.set("n", "<leader>sd", "<cmd>Pick diagnostic<CR>", { desc = "Search diagnostics" })
vim.keymap.set("n", "<leader>s.", "<cmd>Pick oldfiles<CR>",   { desc = "Recent files" })
vim.keymap.set("n", "<leader>sr", "<cmd>Pick resume<CR>",     { desc = "Resume last search" })

local clue = require('mini.clue')
clue.setup({
    triggers = {
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
    },
    clues = {
        { mode = 'n', keys = '<Leader>s', desc = '+search' },
        { mode = 'n', keys = '<Leader>g', desc = '+git' },
        { mode = 'n', keys = '<Leader>b', desc = '+buffer' },
        { mode = 'n', keys = '<Leader>d', desc = '+diagnostics' },
        { mode = 'n', keys = '<Leader>p', desc = '+packages' },
        { mode = 'n', keys = '<Leader>r', desc = '+rename/refactor' },
        clue.gen_clues.g(),
        clue.gen_clues.z(),
        clue.gen_clues.windows(),
    },
    window = {
        delay = 400,
        config = { width = 'auto' },
    },
})
