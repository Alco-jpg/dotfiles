require('mason').setup()

-- Java: use SHA256 of the full cwd path to avoid collisions between
-- two projects with the same directory basename (e.g. ~/work/api vs ~/personal/api)
vim.lsp.config('jdtls', {
    cmd = {
        'jdtls',
        '-data', vim.fn.expand('~/.local/share/jdtls/workspaces/' .. vim.fn.sha256(vim.fn.getcwd())),
    },
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime   = { version = 'LuaJIT' },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.enable({ 'ts_ls', 'jdtls', 'lua_ls', 'cssls', 'html', 'jsonls', 'eslint' })

require('blink.cmp').setup({
    keymap = { preset = 'default' },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
    },

    sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
            -- Neovim Lua API completions; ranked above LSP to avoid noise
            lazydev = {
                name   = 'LazyDev',
                module = 'lazydev.integrations.blink',
                score_offset = 100,
            },
            -- Enable friendly-snippets library
            snippets = {
                opts = { friendly_snippets = true },
            },
        },
    },

    signature = { enabled = true },
})
