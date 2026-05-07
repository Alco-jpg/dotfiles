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
opt.undodir = vim.fn.stdpath("state").. "/undo"
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
