local map = vim.keymap.set

-- general
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map({'i', 'v'}, '<C-c>', '<Esc>')
map({'i', 'n', 'v'}, '<C-s>', '<cmd>wa<CR>', { desc = 'Save all buffers (:wa)' })
map('n', 'Q', 'nop')
map('x', '<leader>p', [['_dP]])
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- buffer
map('n', '<leader>bd', '<cmd>bd<CR>', { desc = 'Close buffer' })
map('n', '<leader>bn', '<cmd>enew<CR>', { desc = 'New buffer' })
map('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Prev buffer' })
map('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Next buffer' })

-- window
map('n', '<leader>wd', '<C-W>c', { desc = 'Close window' })
map('n', '<leader>w-', '<C-W>s', { desc = 'Split window below' })
map('n', '<leader>w|', '<C-W>v', { desc = 'Split window right' })
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window' })

-- terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Enter Normal Mode' })
