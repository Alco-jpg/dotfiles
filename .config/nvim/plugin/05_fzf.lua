require('fzf-lua').setup({
    winopts = {
        height  = 0.85,
        width   = 0.80,
        row     = 0.35,
        col     = 0.50,
        preview = {
            layout       = 'flex',
            flip_columns = 120,
        },
    },
    grep = {
        rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096',
    },
})

-- <space><space> (global): loads all rg results into fzf so fzf handles ALL filtering.
-- Typing "somevariable agent" ANDs both terms against the "path:line:content" string,
-- so either term can match the path and the other the content — order doesn't matter.
-- Falls back to cwd when mini.files is not open (buffer-local binding takes priority inside it).
vim.keymap.set("n", "<leader><leader>", function()
    require('fzf-lua').grep_project()
end, { desc = "Fuzzy search (path+content)" })

vim.keymap.set("n", "<leader>sg", function()
    require('fzf-lua').live_grep()
end, { desc = "Live grep (content)" })

vim.keymap.set("n", "<leader>s/", function()
    require('fzf-lua').lgrep_curbuf()
end, { desc = "Live grep current buffer" })
