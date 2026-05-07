local ok, sm = pcall(require, 'supermaven-nvim')
if not ok then return end

sm.setup({
    keymaps = {
        accept_suggestion = '<Tab>',
        clear_suggestion = '<C-]>',
        accept_word = '<C-j>',
    },
})
