local ok = pcall(require, 'diffview')
if not ok then return end

local map = vim.keymap.set
map('n', '<leader>gv', '<cmd>DiffviewOpen<CR>',           { desc = 'Diff view open' })
map('n', '<leader>gV', '<cmd>DiffviewClose<CR>',          { desc = 'Diff view close' })
map('n', '<leader>gh', '<cmd>DiffviewFileHistory %<CR>',   { desc = 'File history (current)' })
map('n', '<leader>gH', '<cmd>DiffviewFileHistory<CR>',    { desc = 'Repo history' })
