-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local km = vim.keymap
local opts = { silent = true }

km.set("", ";", ":")

km.set("n", "n", "h", opts)
km.set("n", "e", "j", opts)
km.set("n", "i", "k", opts)
km.set("n", "o", "l", opts)

km.set("n", "h", "n", opts)
km.set("n", "l", "e", opts)
km.set("n", "k", "o", opts)
--km.set("n", "j", "e", opts)

km.set("", "r", "i", opts)
km.set("n", "<C-p>", "<C-o>", { desc = "Go back" })

-- Move to window using the <ctrl> hjkl keys
km.set("n", "<C-n>", "<C-w>h", { desc = "Go to left window" })
km.set("n", "<C-e>", "<C-w>j", { desc = "Go to lower window" })
km.set("n", "<C-i>", "<C-w>k", { desc = "Go to upper window" })
km.set("n", "<C-o>", "<C-w>l", { desc = "Go to right window" })

km.set("i", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
km.set("i", "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
