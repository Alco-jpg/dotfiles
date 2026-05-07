-- ~/.config/nvim/plugin/03_lsp_completion.lua

-- Initializes Mason to handle the downloading of external LSP binaries from upstream registries.
require('mason').setup()

-- Java: per-project workspace so jdtls doesn't mix indexing across repos
vim.lsp.config('jdtls', {
    cmd = {
        'jdtls',
        '-data', vim.fn.expand('~/.local/share/jdtls/workspaces/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')),
    },
})

vim.lsp.enable({ 'ts_ls', 'jdtls' })

-- Initializes the blink.cmp completion engine.
require('blink.cmp').setup({
    keymap = { preset = 'default' },
    
    appearance = {
        -- Overrides default behaviors to closely mimic the legacy nvim-cmp visual style.
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
    },
    
    -- Specifies the hierarchy and prioritization of autocompletion sources.
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    
    -- Activates experimental signature help integration directly attached to the prompt.
    signature = { enabled = true }
})
