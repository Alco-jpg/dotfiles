require('mini.icons').setup()
require('mini.ai').setup({ n_lines = 50 })
require('mini.surround').setup()
require('mini.pairs').setup()
require('mini.comment').setup()
require('mini.diff').setup({
    view = {
        style = 'sign',
        signs = { add = '▎', change = '▎', delete = '' },
    },
})
require('mini.statusline').setup()

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
            require('mini.pick').builtin.grep_live(nil, { source = { cwd = dir } })
        end, { buffer = buf, desc = "Grep from hovered folder" })
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
vim.keymap.set("n", "<leader>sg", "<cmd>Pick grep_live<CR>",  { desc = "Search grep (cwd)" })
vim.keymap.set("n", "<leader>sh", "<cmd>Pick help<CR>",       { desc = "Search help" })
vim.keymap.set("n", "<leader>sd", "<cmd>Pick diagnostic<CR>", { desc = "Search diagnostics" })
vim.keymap.set("n", "<leader>s.", "<cmd>Pick oldfiles<CR>",   { desc = "Recent files" })
vim.keymap.set("n", "<leader>sr", "<cmd>Pick resume<CR>",    { desc = "Resume last search" })
