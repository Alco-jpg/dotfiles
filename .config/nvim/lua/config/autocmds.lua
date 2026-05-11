local api = vim.api

api.nvim_create_autocmd("TextYankPost", {
    group = api.nvim_create_augroup("HighlightYank", { clear = true }),
    callback = function()
        vim.hl.on_yank({ higroup = "IncSearch", timeout = 100 })
    end,
})

-- Spell checking for prose-like filetypes
api.nvim_create_autocmd("FileType", {
    group = api.nvim_create_augroup("SpellCheck", { clear = true }),
    pattern = { "markdown", "gitcommit", "text", "plaintext" },
    callback = function()
        vim.opt_local.spell    = true
        vim.opt_local.spelllang = "en_us"
    end,
})

api.nvim_create_autocmd("LspAttach", {
    group = api.nvim_create_augroup("LspSetup", { clear = true }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        -- Enable inlay hints per-buffer when the server supports them
        if client and client.supports_method('textDocument/inlayHint') then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end

        local map = function(keys, fn, desc, opts)
            vim.keymap.set('n', keys, fn, vim.tbl_extend('force', { buffer = ev.buf, desc = desc }, opts or {}))
        end

        map('gd',         vim.lsp.buf.definition,      'Go to definition')
        map('gD',         vim.lsp.buf.declaration,     'Go to declaration')
        map('gr',         vim.lsp.buf.references,      'Go to references', { nowait = true })
        map('gi',         vim.lsp.buf.implementation,  'Go to implementation')
        map('K',          vim.lsp.buf.hover,           'Hover docs')
        map('<leader>ca', vim.lsp.buf.code_action,     'Code actions')
        map('<leader>dt', vim.lsp.buf.type_definition, 'Go to type definition')
        map('<leader>ds', function()
            require('mini.pick').builtin.lsp({ scope = 'document_symbol' })
        end, 'Document symbols')

        -- Use inc-rename for live preview if available, fall back to built-in
        map('<leader>rn', function()
            local ok = pcall(require, 'inc_rename')
            if ok then
                return ':IncRename ' .. vim.fn.expand('<cword>')
            end
            return '<cmd>lua vim.lsp.buf.rename()<CR>'
        end, 'Rename symbol', { expr = true })
    end,
})
