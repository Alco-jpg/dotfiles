vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.pack.add({
    -- Core Libraries and Interface
    { src = 'https://github.com/echasnovski/mini.nvim' },
    
    -- Syntax Intelligence and Parsing
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
    
    -- Language Server Management and Configuration Base
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' }, -- Injects community-standard default settings.
    
    -- High-Velocity SIMD Completion Engine 
    { src = 'https://github.com/saghen/blink.lib' },
    { src = 'https://github.com/saghen/blink.cmp' },

    -- AI Inline Completion
    { src = 'https://github.com/supermaven-inc/supermaven-nvim' },

    -- Formatter
    { src = 'https://github.com/stevearc/conform.nvim' },

    -- Fuzzy Finder
    { src = 'https://github.com/ibhagwan/fzf-lua' },

    -- Catppuccin Theme
    { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
})

require("config.options")
require("config.keymaps")
require("config.autocmds")
