return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        local tree = require("neo-tree.command")
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", { silent = true, desc = "Explore files (cwd)" })
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
        vim.keymap.set("n", "<leader>E", function()
            local file = vim.fn.expand("%:p")
            if (file == '') then
                file = vim.fn.getcwd()
            else
                local f = io.open(file, "r")
                if (f) then
                    f.close(f)
                else
                    file = vim.fn.getcwd()
                end
            end
            tree.execute({
                action = "focus",
                source = "filesystem",
                position = "left",
                reveal_file = file,
                reveal_focus_cwd = true,
            })
        end,
        { silent = true, desc = "Explore files (current file)" })
	end,
}
