-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local setkeymap = vim.api.nvim_set_keymap

setkeymap("n", "<leader>h", ":wincmd h <CR>", { silent = true })
setkeymap("n", "<leader>j", ":wincmd j <CR>", { silent = true })
setkeymap("n", "<leader>k", ":wincmd k <CR>", { silent = true })
setkeymap("n", "<leader>l", ":wincmd l <CR>", { silent = true })
