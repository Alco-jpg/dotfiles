require('mini.git').setup()

local map = vim.keymap.set

local function open_lazygit()
    local width  = math.floor(vim.o.columns * 0.9)
    local height = math.floor(vim.o.lines   * 0.9)
    local col    = math.floor((vim.o.columns - width)  / 2)
    local row    = math.floor((vim.o.lines   - height) / 2)

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width    = width,
        height   = height,
        col      = col,
        row      = row,
        style    = 'minimal',
        border   = 'rounded',
    })
    vim.fn.termopen('lazygit', {
        on_exit = function() vim.api.nvim_buf_delete(buf, { force = true }) end,
    })
    vim.cmd('startinsert')
end

map('n', '<leader>gg', open_lazygit,                 { desc = 'Open lazygit' })
map('n', '<leader>gs', '<cmd>Git<CR>',               { desc = 'Git status' })
map('n', '<leader>gc', '<cmd>Git commit<CR>',         { desc = 'Git commit' })
map('n', '<leader>gP', '<cmd>Git push<CR>',           { desc = 'Git push' })
map('n', '<leader>gl', '<cmd>Git log --oneline<CR>',  { desc = 'Git log' })
map('n', '<leader>gb', function()
    require('mini.git').show_at_cursor()
end, { desc = 'Git blame / show at cursor' })

map('n', ']h', function() require('mini.diff').go_hunk('next') end, { desc = 'Next hunk' })
map('n', '[h', function() require('mini.diff').go_hunk('prev') end, { desc = 'Prev hunk' })
map('n', '<leader>gd', function()
    require('mini.diff').toggle_overlay(0)
end, { desc = 'Git diff overlay' })

map({ 'n', 'x' }, '<leader>hs', function() require('mini.diff').operator('apply') end, { desc = 'Stage hunk' })
map({ 'n', 'x' }, '<leader>hr', function() require('mini.diff').operator('reset') end, { desc = 'Reset hunk' })
