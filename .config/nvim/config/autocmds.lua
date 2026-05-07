local api = vim.api

local yank_group = api.nvim_create_augroup("HighlightYank", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
    group = yank_group,
    callback = function()
        -- Temporarily applies the IncSearch highlight group to the yanked text coordinates.
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
    end,
})

local format_group = api.nvim_create_augroup("LspFormatting", { clear = true })
api.nvim_create_autocmd("LspAttach", {
    group = format_group,
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        
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
