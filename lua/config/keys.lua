local map = vim.keymap.set

-- general
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map({ "i", "v" }, "<C-c>", "<Esc>")
map({ "i", "n", "v" }, "<C-s>", "<cmd>wa<CR>", { desc = "Save all buffers (:wa)" })
map("n", "Q", "<nop>")
map("n", "<space>", "<nop>")
map("x", "<leader>p", [["_dP]], { desc = "Paste without replacing yanked text" })
-- map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- buffer
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "New buffer" })
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<leader>bo", require("util.buffers").close_others, { desc = "Close other buffers" })
map("n", "<leader>bl", require("util.buffers").close_left, { desc = "Close left buffers" })
map("n", "<leader>br", require("util.buffers").close_right, { desc = "Close right buffers" })
map("n", "<leader>bp", require("util.buffers").close_unmodified, { desc = "Close buffers not modified" })

-- window
map("n", "<leader>wd", "<C-W>c", { desc = "Close window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- terminal
map("n", "<leader>tv", "<cmd>:vsplit term://fish<CR>", { desc = "Open new terminal" })
map("n", "<leader>th", "<cmd>:split term://fish<CR>", { desc = "Open new terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Enter Normal Mode (in terminal)" })

-- fuzzyfind
map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Fuzzyfind files" })
map("n", "<leader>fr", "<cmd>FzfLua resume<CR>", { desc = "Fuzzyfind resume" })
map("n", "<leader>fh", "<cmd>FzfLua helptags<CR>", { desc = "Fuzzyfind helptags" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Fuzzyfind buffers" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep_native<CR>", { desc = "Fuzzyfind grep" })
map("n", "<leader>fk", "<cmd>FzfLua keymaps<CR>", { desc = "Fuzzyfind keymaps" })

-- copilot
-- map("n", "<leader>cpp", "<cmd>Copilot panel open<CR>", { desc = "Open Copilot panel" })
-- map("n", "<leader>cpd", "<cmd>Copilot panel close<CR>", { desc = "Close Copilot panel" })
