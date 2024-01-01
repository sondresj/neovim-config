vim.g.mapleader = " "
vim.keymap.set('n', "<space>", "<Nop>")

-- note: the following is not all keymappings, some are also set up for plugins, which cannot be mapped here.
-- todo: add { desc = "DESCRIPTION HERE"} for all mappings

-- General mappings
vim.keymap.set({ 'i', 'v' }, "<C-c>", "<Esc>")                                -- don't force kill terminal app, just esc instead
vim.keymap.set({ 'i', 'n', 'v' }, "<C-s>", "<cmd>wa<CR>", { desc = "Save all modified buffers (:wa)" })
vim.keymap.set({ 'i', 'n' }, "<esc>", "<cmd>noh<CR><esc>", { silent = true }) -- clear search on esc
vim.keymap.set('n', "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all (:qa)" })

-- Code
vim.keymap.set('n', "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostics" })
vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename, { desc = "Rename identifier under cursor" })
-- note: there are many more keymappings in plugins/lsp.lua

-- Line movement (insert mode sift arrows to move line)
vim.keymap.set('n', "<S-Up>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set('n', "<S-Down>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set('i', "<S-Up>", "<esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
vim.keymap.set('i', "<S-Down>", "<esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set('v', "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set('v', "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- Buffer management
vim.keymap.set('n', "<leader>bd", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set('n', "<leader>bn", "<cmd>enew<CR>", { desc = "New buffer" })
vim.keymap.set('n', "<S-Left>", "<cmd>bprevious<CR>", { desc = "Go to left buffer" })
vim.keymap.set('n', "<S-Right>", "<cmd>bnext<CR>", { desc = "Go to right buffer" })

-- Window management
vim.keymap.set('n', "<leader>wd", "<C-W>c", { desc = "Close window" })
vim.keymap.set('n', "<leader>w-", "<C-W>s", { desc = "Split window below" })
vim.keymap.set('n', "<leader>w|", "<C-W>v", { desc = "Split window right" })
vim.keymap.set('n', "<C-Left>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set('n', "<C-Right>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set('n', "<C-Up>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set('n', "<C-Down>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set('n', "<A-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set('n', "<A-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })
vim.keymap.set('n', "<A-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set('n', "<A-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })

-- Terminal management
local term = function()
    echo "todo"
end
vim.keymap.set('n', "<leader>tv", term, { desc = "Open terminal in vertical split window" })
vim.keymap.set('n', "<leader>ts", "", { desc = "Open terminal in horizontal split window" })
vim.keymap.set('t', "<esc><esc>", "<C-\\><C-n>", { desc = "Exit insert mode (from terminal)" })
