local ok, trouble = pcall(require, 'trouble')
if not ok then return end

trouble.setup()

local map = vim.keymap.set
map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>',               { desc = 'Project diagnostics' })
map('n', '<leader>xb', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',  { desc = 'Buffer diagnostics' })
map('n', '<leader>xr', '<cmd>Trouble lsp_references toggle<CR>',            { desc = 'LSP references' })
map('n', '<leader>xq', '<cmd>Trouble qflist toggle<CR>',                    { desc = 'Quickfix list' })
map('n', '<leader>xt', '<cmd>Trouble todo toggle<CR>',                      { desc = 'Todo list' })
