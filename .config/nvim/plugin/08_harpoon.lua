local ok_mark = pcall(require, 'harpoon.mark')
local ok_ui   = pcall(require, 'harpoon.ui')
if not (ok_mark and ok_ui) then return end

local mark = require('harpoon.mark')
local ui   = require('harpoon.ui')

local map = vim.keymap.set
map('n', '<leader>ma', mark.add_file,        { desc = 'Mark: add file' })
map('n', '<leader>mm', ui.toggle_quick_menu, { desc = 'Mark: menu' })
map('n', '<leader>1',  function() ui.nav_file(1) end, { desc = 'Jump to mark 1' })
map('n', '<leader>2',  function() ui.nav_file(2) end, { desc = 'Jump to mark 2' })
map('n', '<leader>3',  function() ui.nav_file(3) end, { desc = 'Jump to mark 3' })
map('n', '<leader>4',  function() ui.nav_file(4) end, { desc = 'Jump to mark 4' })
