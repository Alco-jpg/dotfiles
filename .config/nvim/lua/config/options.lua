local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

opt.clipboard = "unnamedplus"
opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"
opt.updatetime = 250
opt.timeoutlen = 300

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

opt.termguicolors = true

opt.scrolloff = 8
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
opt.wrap = false
opt.laststatus = 3

-- Modern UX
opt.smoothscroll  = true
opt.jumpoptions   = 'stack,view'
opt.confirm       = true
opt.virtualedit   = 'block'

-- Treesitter-powered folds, all open by default
opt.foldmethod     = 'expr'
opt.foldexpr       = 'v:lua.vim.treesitter.foldexpr()'
opt.foldlevel      = 99
opt.foldlevelstart = 99

-- Nicer diagnostic floats with source attribution
vim.diagnostic.config({
    signs            = true,
    virtual_text     = { prefix = '●' },
    update_in_insert = false,
    severity_sort    = true,
    float            = { border = 'rounded', source = true },
})
