lvim.keys.normal_mode[";"] = ":" --, "enter command mode", opts = { nowait = true } },
lvim.keys.normal_mode["n"] = "h" --, opts = { silent = true } },
lvim.keys.normal_mode["e"] = "j" --, opts = { silent = true } },
lvim.keys.normal_mode["i"] = "k" --, opts = { silent = true } },
lvim.keys.normal_mode["o"] = "l" --, opts = { silent = true } },

lvim.keys.normal_mode["h"] = "i" --, opts = { silent = true } },
lvim.keys.normal_mode["j"] = "e" --, opts = { silent = true } },
lvim.keys.normal_mode["k"] = "o" --, opts = { silent = true } },
lvim.keys.normal_mode["l"] = "n" --, opts = { silent = true } },

-- km("i", "jj", "<Esc>", opts)
lvim.keys.normal_mode["<C-p>"] = "<C-o>" --, opts = { desc = "Go back" } },

-- Move to window using the <ctrl> hjkl keys
lvim.keys.normal_mode["<C-n>"] = "<C-w>h" --, opts = { desc = "Go to left window", silent = true } },
lvim.keys.normal_mode["<C-e>"] = "<C-w>j" --, opts = { desc = "Go to lower window", silent = true } },
lvim.keys.normal_mode["<C-i>"] = "<C-w>k" --, opts = { desc = "Go to lower window", silent = true } },
lvim.keys.normal_mode["<C-o>"] = "<C-w>l" --, opts = { desc = "Go to lower window", silent = true } },
