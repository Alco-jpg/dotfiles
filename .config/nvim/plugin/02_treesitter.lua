local ok, ts = pcall(require, 'nvim-treesitter.configs')
if ok then
    ts.setup({ indent = { enable = true } })
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local bufnr = args.buf
        local ft = vim.bo[bufnr].filetype

        -- 1. Create a "No-Fly List" for specific filetypes
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

        -- 2. Check if a parser actually exists on the system disk
        -- This is the most reliable way to prevent the "Parser could not be created" error
        local lang = vim.treesitter.language.get_lang(ft) or ft
        local has_parser = pcall(vim.treesitter.get_parser, bufnr, lang)
        
        if has_parser then
            vim.schedule(function()
                if vim.api.nvim_buf_is_valid(bufnr) then
                    -- Use pcall here too as a final fail-safe
                    pcall(vim.treesitter.start, bufnr, lang)
                end
            end)
        end
    end,
})
