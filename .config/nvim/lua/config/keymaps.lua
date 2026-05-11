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

-- Buffer cycling
keymap("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
keymap("n", "<S-l>", "<cmd>bnext<CR>",     { desc = "Next buffer" })

-- Diagnostics (updated to non-deprecated API)
keymap("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic float" })
keymap("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Prev diagnostic" })
keymap("n", "]d", function() vim.diagnostic.jump({ count =  1, float = true }) end, { desc = "Next diagnostic" })

-- Quickfix list navigation
keymap("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix" })
keymap("n", "[q", "<cmd>cprev<CR>", { desc = "Prev quickfix" })

-- Toggle inlay hints globally
keymap("n", "<leader>ih", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
