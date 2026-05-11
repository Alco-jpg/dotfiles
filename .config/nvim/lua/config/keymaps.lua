local keymap = vim.keymap.set

keymap("n", "<leader>pu", "<cmd>lua vim.pack.update()<CR>", { desc = "Update Packages" })

keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page (centered)" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page (centered)" })

keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer" })

keymap("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic error float" })
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
