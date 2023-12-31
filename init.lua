require("options")
require("keymap")

-- Use Lazy as nvim package manager. 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- "plugins" means lazy will source all lua files in the plugins directory, and merge these togheter.
-- Each of those lua files must return a table that lazy understands. See lazy docs 
require("lazy").setup("plugins", {})

