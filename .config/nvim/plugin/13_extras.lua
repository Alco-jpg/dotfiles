-- Proper Neovim Lua API completion in lua_ls (types for vim.*, vim.lsp.*, etc.)
local ok_ld = pcall(require, 'lazydev')
if ok_ld then
    require('lazydev').setup({
        library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
    })
end

-- Auto-close and auto-rename HTML / JSX / TSX tags via treesitter
local ok_at = pcall(require, 'nvim-ts-autotag')
if ok_at then
    require('nvim-ts-autotag').setup()
end

-- Highlight and search TODO / FIXME / HACK / NOTE / BUG across the project
local ok_td = pcall(require, 'todo-comments')
if ok_td then
    require('todo-comments').setup()
end

-- Live rename: shows rename results inline as you type (keymap wired in autocmds.lua LspAttach)
local ok_ir = pcall(require, 'inc_rename')
if ok_ir then
    require('inc_rename').setup()
end

-- Render markdown headings, code fences, and tables in-buffer
local ok_rm = pcall(require, 'render-markdown')
if ok_rm then
    require('render-markdown').setup()
end
