local keymap = vim.keymap.set

keymap("n", "<leader>pu", "<cmd>lua vim.pack.update()<CR>", { desc = "Update Packages" })

keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Grep from project root (git root > package.json > pom.xml > cwd)
keymap("n", "<space><space>", function()
    local root = vim.fs.root(0, { '.git', 'package.json', 'pom.xml' }) or vim.fn.getcwd()
    require('mini.pick').builtin.grep_live(nil, { source = { cwd = root } })
end, { desc = "Grep from project root" })

keymap("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic error float" })
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
