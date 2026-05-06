local opt = vim.opt

-- Performance & Logic
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.undofile = true           -- Persistent undo
opt.timeoutlen = 300          -- Faster key sequence completion

-- Formatting (Metric-friendly/Standard)
opt.shiftwidth = 4            -- 4 spaces for indent
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true

-- UI Scannability
opt.number = true             -- Show line numbers
opt.relativenumber = true     -- Faster vertical jumping
opt.termguicolors = true      -- True color support
opt.signcolumn = "yes"        -- Prevent layout shift with diagnostics
opt.cursorline = true         -- Highlight current line
