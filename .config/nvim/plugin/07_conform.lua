local format_enabled = true

vim.api.nvim_create_user_command('FormatToggle', function()
    format_enabled = not format_enabled
    vim.notify('Format on save ' .. (format_enabled and 'enabled' or 'disabled'), vim.log.levels.INFO)
end, { desc = 'Toggle format on save' })

require('conform').setup({
    formatters_by_ft = {
        javascript      = { 'prettierd', 'prettier', stop_after_first = true },
        typescript      = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        css             = { 'prettierd', 'prettier', stop_after_first = true },
        html            = { 'prettierd', 'prettier', stop_after_first = true },
        json            = { 'prettierd', 'prettier', stop_after_first = true },
        jsonc           = { 'prettierd', 'prettier', stop_after_first = true },
        yaml            = { 'prettierd', 'prettier', stop_after_first = true },
        markdown        = { 'prettierd', 'prettier', stop_after_first = true },
    },
    format_on_save = function()
        if not format_enabled then return end
        return { timeout_ms = 500, lsp_fallback = true }
    end,
})
