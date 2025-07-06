vim.g.mapleader = ' '
vim.g.maplocalleader = 'å'

vim.o.termguicolors = true
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = 'a'
vim.o.virtualedit = 'block'

vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menu,menuone,noselect'

vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.swapfile = false
vim.o.backup = false

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.cursorline = true
vim.o.inccommand = 'split'
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.showmode = false
vim.o.spelllang = 'en', 'no'

vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.g.editorconfig = true
vim.o.smartindent = true
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.list = true
vim.o.ruler = false
vim.o.wrap = true

vim.lsp.inlay_hint.enable(false, nil)
vim.o.smoothscroll = true
