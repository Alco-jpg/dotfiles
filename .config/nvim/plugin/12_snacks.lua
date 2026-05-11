local ok, snacks = pcall(require, 'snacks')
if not ok then return end

snacks.setup({
    -- Replace vim.notify with a proper toast notification system
    notifier     = { enabled = false },

    -- Automatically disables heavy features (treesitter, LSP, indent) on large files
    bigfile      = { enabled = true },

    -- Richer statuscolumn (handles line numbers, fold markers, signs cleanly)
    statuscolumn = { enabled = true },

    -- Explicitly off — terminal lives in the multiplexer, not here
    terminal  = { enabled = false },
    dashboard = { enabled = false },
    -- mini.indentscope already handles indent guides
    indent    = { enabled = false },
})
