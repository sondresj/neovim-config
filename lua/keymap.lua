vim.g.mapleader = " "
vim.keymap.set('n', "<space>", "<Nop>")

-- note: the following is not all keymappings, some are also set up for plugins, which cannot be mapped here.
-- todo: add { desc = "DESCRIPTION HERE"} for all mappings

-- General mappings
vim.keymap.set({ 'i', 'v' }, "<C-c>", "<Esc>")           -- don't force kill terminal app, just esc instead
vim.keymap.set({ 'i', 'n', 'v' }, "<C-s>", "<cmd>wa<CR>") -- save all
vim.keymap.set({ 'i', 'n' }, "<esc>", "<cmd>noh<CR><esc>") -- clear search on esc
vim.keymap.set('n', "<leader>qq", "<cmd>qa<CR>") -- quit all (if all buffers are saved)

-- Code
vim.keymap.set('n', "<leader>e", vim.diagnostic.open_float)
vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename)
-- note: there are many more keymappings in plugins/lsp.lua

-- Line movement (insert mode sift arrows to move line)
vim.keymap.set('n', "<S-Up>", "<cmd>m .-2<CR>==")          -- move line up
vim.keymap.set('n', "<S-Down>", "<cmd>m .+1<CR>==")        -- move line down
vim.keymap.set('i', "<S-Up>", "<esc><cmd>m .-2<CR>==gi")   -- move line up
vim.keymap.set('i', "<S-Down>", "<esc><cmd>m .+1<CR>==gi") -- move line down
vim.keymap.set('v', "<S-Up>", ":m '<-2<CR>gv=gv")          -- move line up
vim.keymap.set('v', "<S-Down>", ":m '>+1<CR>gv=gv")        -- move line down

-- Buffer management
vim.keymap.set('n', "<leader>bd", "<cmd>bd<CR>")      -- close buffer (if saved)
vim.keymap.set('n', "<leader>bn", "<cmd>enew<CR>")    -- new buffer (or actually file)
vim.keymap.set('n', "<S-Left>", "<cmd>bprevious<CR>") -- go to left buffer
vim.keymap.set('n', "<S-Right>", "<cmd>bnext<CR>")    -- go to right buffer

-- Window management
vim.keymap.set('n', "<leader>wd", "<C-W>c")                     -- close window
vim.keymap.set('n', "<leader>w-", "<C-W>s")                     -- split window below
vim.keymap.set('n', "<leader>w|", "<C-W>v")                     -- split window right
vim.keymap.set('n', "<C-Left>", "<C-w>h")                       -- go to left window
vim.keymap.set('n', "<C-Right>", "<C-w>l")                      -- go to right window
vim.keymap.set('n', "<C-Up>", "<C-w>k")                         -- go to upper window
vim.keymap.set('n', "<C-Down>", "<C-w>j")                       -- go to lower window
vim.keymap.set('n', "<A-Left>", "<cmd>vertical resize -2<CR>")  -- decrease window width
vim.keymap.set('n', "<A-Right>", "<cmd>vertical resize +2<CR>") -- increase window widht
vim.keymap.set('n', "<A-Up>", "<cmd>resize +2<CR>")             -- increase window height
vim.keymap.set('n', "<A-Down>", "<cmd>resize -2<CR>")           -- decrease window height

-- Terminal management
local term = function()
    echo "todo"
end
vim.keymap.set('n', "<leader>tv", term)          -- open terminal split right (v=vertical)
vim.keymap.set('n', "<leader>ts", "")            -- open termianl split down (s=split horizontal)
vim.keymap.set('t', "<esc><esc>", "<C-\\><C-n>") -- exit insert mode (ie enter normal mode)
