vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.pack.add({
    -- Core Libraries and Interface
    { src = 'https://github.com/echasnovski/mini.nvim' },

    -- Syntax Intelligence and Parsing
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },

    -- Language Server Management and Configuration Base
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },

    -- Lua API completion for Neovim config files
    { src = 'https://github.com/folke/lazydev.nvim' },

    -- High-Velocity SIMD Completion Engine
    { src = 'https://github.com/saghen/blink.lib' },
    { src = 'https://github.com/saghen/blink.cmp' },

    -- Snippets library
    { src = 'https://github.com/rafamadriz/friendly-snippets' },

    -- AI Inline Completion
    { src = 'https://github.com/supermaven-inc/supermaven-nvim' },

    -- Formatter
    { src = 'https://github.com/stevearc/conform.nvim' },

    -- Fuzzy Finder
    { src = 'https://github.com/ibhagwan/fzf-lua' },

    -- Catppuccin Theme
    { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },

    -- Fast file switching (harpoon v2)
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/ThePrimeagen/harpoon', name = 'harpoon' },

    -- Diagnostics panel
    { src = 'https://github.com/folke/trouble.nvim' },

    -- Motion / navigation
    { src = 'https://github.com/folke/flash.nvim' },

    -- Full-featured git diff + file history viewer
    { src = 'https://github.com/sindrets/diffview.nvim' },

    -- TODO/FIXME/NOTE highlights across project
    { src = 'https://github.com/folke/todo-comments.nvim' },

    -- QoL: notifications, bigfile handler, statuscolumn
    { src = 'https://github.com/folke/snacks.nvim' },

    -- Live rename preview
    { src = 'https://github.com/smjonas/inc-rename.nvim' },

    -- HTML/JSX auto-close and rename tags
    { src = 'https://github.com/windwp/nvim-ts-autotag' },

    -- Rendered markdown in buffer
    { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
})

require("config.options")
require("config.keymaps")
require("config.autocmds")
