require('mini.git').setup()

local map = vim.keymap.set

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
