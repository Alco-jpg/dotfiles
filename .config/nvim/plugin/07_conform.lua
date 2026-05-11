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
    format_on_save = {
        timeout_ms   = 500,
        lsp_fallback = true,  -- falls back to LSP for filetypes not listed above (e.g. Java)
    },
})
