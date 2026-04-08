vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode("<cr>")

vim.o.winborder = "rounded"

vim.o.termguicolors = true
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = "a"
vim.o.virtualedit = "block"

-- vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menu,menuone,noselect,popup,fuzzy"
vim.o.complete = ".^5,t^3,w"
vim.o.pummaxwidth = 40
vim.o.pumborder = "rounded"
-- vim.o.pumheight = 10

vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.swapfile = false
vim.o.backup = false

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"

vim.o.updatetime = 400
vim.o.timeoutlen = 600

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.cursorline = true
vim.o.inccommand = "split"
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.showmode = false
vim.o.spelllang = "en,no"

vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.g.editorconfig = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.ruler = false
vim.o.wrap = true

-- vim.lsp.inlay_hint.enable(false, nil)
vim.o.smoothscroll = true
vim.opt.shortmess:append("c")
vim.o.autocomplete = true
