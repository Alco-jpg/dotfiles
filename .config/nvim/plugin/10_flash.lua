local ok, flash = pcall(require, 'flash')
if not ok then return end

flash.setup()

local map = vim.keymap.set
-- s: jump anywhere on screen by label; S: treesitter-aware jump (whole nodes)
map({ 'n', 'x', 'o' }, 's', function() flash.jump() end,              { desc = 'Flash jump' })
map({ 'n', 'x', 'o' }, 'S', function() flash.treesitter() end,        { desc = 'Flash treesitter' })
-- operator-pending only: act on remote text without moving cursor
map('o',               'r', function() flash.remote() end,            { desc = 'Flash remote' })
map({ 'o', 'x' },     'R', function() flash.treesitter_search() end, { desc = 'Flash treesitter search' })
