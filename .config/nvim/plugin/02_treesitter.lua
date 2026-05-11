local ok, ts = pcall(require, 'nvim-treesitter.configs')
if ok then
    ts.setup({
        indent       = { enable = true },
        auto_install = true,
        ensure_installed = {
            'lua', 'vim', 'vimdoc',
            'typescript', 'tsx', 'javascript',
            'json', 'jsonc', 'html', 'css',
            'markdown', 'markdown_inline',
            'java', 'bash', 'python', 'yaml',
        },
        textobjects = {
            select = {
                enable    = true,
                lookahead = true,
                keymaps   = {
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                },
            },
            move = {
                enable    = true,
                set_jumps = true,
                goto_next_start     = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
                goto_next_end       = { [']M'] = '@function.outer', [']['] = '@class.outer' },
                goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
                goto_previous_end   = { ['[M'] = '@function.outer', ['[]'] = '@class.outer' },
            },
        },
    })
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local bufnr = args.buf
        local ft = vim.bo[bufnr].filetype

        local ignore_ft = {
            "blink-cmp-menu",
            "blink-cmp-doc",
            "mason",
            "mason_backdrop",
            "TelescopePrompt",
            ""
        }

        for _, name in ipairs(ignore_ft) do
            if ft == name then return end
        end

        local lang = vim.treesitter.language.get_lang(ft) or ft
        local has_parser = pcall(vim.treesitter.get_parser, bufnr, lang)

        if has_parser then
            vim.schedule(function()
                if vim.api.nvim_buf_is_valid(bufnr) then
                    pcall(vim.treesitter.start, bufnr, lang)
                end
            end)
        end
    end,
})
