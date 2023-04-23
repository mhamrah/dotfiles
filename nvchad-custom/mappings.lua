---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["n"] = { "h", opts = { silent = true } },
    ["e"] = { "j", opts = { silent = true } },
    ["i"] = { "k", opts = { silent = true } },
    ["o"] = { "l", opts = { silent = true } },

    ["h"] = { "i", opts = { silent = true } },
    ["j"] = { "e", opts = { silent = true } },
    ["k"] = { "o", opts = { silent = true } },
    ["l"] = { "n", opts = { silent = true } },

    -- km("i", "jj", "<Esc>", opts)
    ["<C-p>"] = { "<C-o>", opts = { desc = "Go back" } },

    -- Move to window using the <ctrl> hjkl keys
    ["<C-n>"] = { "<C-w>h", opts = { desc = "Go to left window", silent = true } },
    ["<C-e>"] = { "<C-w>j", opts = { desc = "Go to lower window", silent = true } },
    ["<C-i>"] = { "<C-w>k", opts = { desc = "Go to upper window", silent = true } },
    ["<C-o>"] = { "<C-w>l", opts = { desc = "Go to right window", silent = true } },

    ["<leader>|"]={ "<cmd>split<cr>", opts={ desc ="Horizontal Split", silent = true } },
    ["<leader>\\"]={  "<cmd>vsplit<cr>", opts={ desc = "Vertical Split", silent = true } },
  },
}

-- more keybinds!

return M
