local api = vim.api

local yank_group = api.nvim_create_augroup("HighlightYank", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
    group = yank_group,
    callback = function()
        -- Temporarily applies the IncSearch highlight group to the yanked text coordinates.
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
    end,
})

local lsp_group = api.nvim_create_augroup("LspFormatting", { clear = true })
api.nvim_create_autocmd("LspAttach", {
    group = lsp_group,
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        local map = function(keys, fn, desc, opts)
            vim.keymap.set('n', keys, fn, vim.tbl_extend('force', { buffer = ev.buf, desc = desc }, opts or {}))
        end

        map('gd',         vim.lsp.buf.definition,      'Go to definition')
        map('gD',         vim.lsp.buf.declaration,     'Go to declaration')
        map('gr',         vim.lsp.buf.references,      'Go to references', { nowait = true })
        map('gi',         vim.lsp.buf.implementation,  'Go to implementation')
        map('K',          vim.lsp.buf.hover,           'Hover docs')
        map('<leader>rn', vim.lsp.buf.rename,          'Rename symbol')
        map('<leader>ca', vim.lsp.buf.code_action,     'Code actions')
        map('<leader>dt', vim.lsp.buf.type_definition, 'Go to type definition')
        map('<leader>ds', function()
            require('mini.pick').builtin.lsp({ scope = 'document_symbol' })
        end, 'Document symbols')

        -- Verifies the attached server actually supports document formatting.
        if client and client:supports_method("textDocument/formatting") then
            api.nvim_create_autocmd("BufWritePre", {
                buffer = ev.buf,
                callback = function()
                    -- Synchronous formatting operation; guarantees the process blocks the file save until completion.
                    vim.lsp.buf.format({ async = false, bufnr = ev.buf })
                end,
            })
        end
    end,
})
