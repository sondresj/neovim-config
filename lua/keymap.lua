vim.g.mapleader = " "
local map = vim.keymap.set

map('n', "<space>", "<nop>")

-- note: the following is not all keymappings, some are also set up for plugins, which cannot be mapped here.
-- In particular, Code mappings reside in plugins/lsp.lua

-- General mappings
map({ 'i', 'v' }, "<C-c>", "<Esc>")                                -- don't force kill terminal app, just esc instead
map({ 'i', 'n', 'v' }, "<C-s>", "<cmd>wa<CR>", { desc = "Save all buffers (:wa)" })
map({ 'i', 'n' }, "<esc>", "<cmd>noh<CR><esc>", { silent = true }) -- clear search on esc
map('n', "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all (:qa)" })
map('n', "Q", "<nop>", { silent = true, desc = "Prevent Q mode" })

-- better arrow movement with wrapped lines
map({ 'n', 'x' }, "<Down>", "gj", { silent = true, desc = "Next visual line (wrapped)" })
map({ 'n', 'x' }, "<Up>", "gk", { silent = true, desc = "Previous visual line (wrapped)" })
map({ 'n', 'x' }, "<End>", "g$", { silent = true, desc = "End of visual line (wrapped)" })
map({ 'n', 'x' }, "<Home>", "g0", { silent = true, desc = "Beginning of visual line (wrapped)" })
map('i', "<Down>", "<C-o>gj", { silent = true, desc = "Next visual line (wrapped)" })
map('i', "<Up>", "<C-o>gk", { silent = true, desc = "Previous visual line (wrapped)" })
map('i', "<End>", "<C-o>g$", { silent = true, desc = "End of visual line (wrapped)" })
map('i', "<Home>", "<C-o>g0", { silent = true, desc = "Beginning of visual line (wrapped)" })

-- Line movement (insert mode sift arrows to move line)
map('n', "<S-Up>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
map('n', "<S-Down>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map('i', "<S-Up>", "<esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
map('i', "<S-Down>", "<esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
map('v', "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map('v', "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- Buffer management
map('n', "<leader>bd", "<cmd>bd<CR>", { desc = "Close buffer" })
map('n', "<leader>bn", "<cmd>enew<CR>", { desc = "New buffer" })
map('n', "<S-Left>", "<cmd>bprevious<CR>", { desc = "Go to left buffer" })
map('n', "<S-Right>", "<cmd>bnext<CR>", { desc = "Go to right buffer" })
map('n', "<S-h>", "<cmd>bprevious<CR>", { desc = "Go to left buffer" })
map('n', "<S-l>", "<cmd>bnext<CR>", { desc = "Go to right buffer" })

-- Window management
map('n', "<leader>wd", "<C-W>c", { desc = "Close window" })
map('n', "<leader>w-", "<C-W>s", { desc = "Split window below" })
map('n', "<leader>w|", "<C-W>v", { desc = "Split window right" })
map('n', "<C-Left>", "<C-w>h", { desc = "Go to left window" })
map('n', "<C-Right>", "<C-w>l", { desc = "Go to right window" })
map('n', "<C-Up>", "<C-w>k", { desc = "Go to upper window" })
map('n', "<C-Down>", "<C-w>j", { desc = "Go to lower window" })
map('n', "<A-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map('n', "<A-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })
map('n', "<A-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map('n', "<A-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })

-- Floating terminal
local termopen = function() require("terminal").open() end
map("n", "<leader>ft", termopen, { desc = "Terminal (root dir)" })
map("n", "<c-/>", termopen, { desc = "Terminal (root dir)" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
