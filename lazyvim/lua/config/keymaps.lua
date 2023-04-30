-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local km = vim.keymap
local opts = { silent = true }

km.set("", ";", ":")

km.set("", "n", "h", opts)
km.set("", "e", "j", opts)
km.set("", "i", "k", opts)
km.set("", "o", "l", opts)

km.set("", "h", "i", opts)
km.set("", "l", "n", opts)
km.set("", "k", "o", opts)
km.set("", "j", "e", opts)

km.set("i", "jj", "<Esc>", opts)

km.set("n", "<C-p>", "<C-o>", { desc = "Go back" })

-- Move to window using the <ctrl> hjkl keys
km.set("n", "<C-n>", "<C-w>h", { desc = "Go to left window" })
km.set("n", "<C-e>", "<C-w>j", { desc = "Go to lower window" })
km.set("n", "<C-i>", "<C-w>k", { desc = "Go to upper window" })
km.set("n", "<C-o>", "<C-w>l", { desc = "Go to right window" })
