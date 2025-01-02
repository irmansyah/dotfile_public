-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local setkeymap = vim.api.nvim_set_keymap

local discipline = require('mane.discipline')
discipline.cowboy()

setkeymap("n", "<leader>h", ":wincmd h <CR>", { silent = true })
setkeymap("n", "<leader>j", ":wincmd j <CR>", { silent = true })
setkeymap("n", "<leader>k", ":wincmd k <CR>", { silent = true })
setkeymap("n", "<leader>l", ":wincmd l <CR>", { silent = true })

function ToggleResizeWidth()
    local current_height = vim.api.nvim_win_get_width(0)
    local default_width = 32
    local double_width = 64

    if current_height == default_width then
        vim.cmd('vertical resize ' .. double_width)
    else
        vim.cmd('vertical resize ' .. default_width)
    end
end

function ToggleResizeHeight()
    local current_width = vim.api.nvim_win_get_height(0)
    local default_height = 20
    local double_height = 100

    if current_width == default_height then
        vim.cmd('horizontal resize ' .. double_height)
    else
        vim.cmd('horizontal resize ' .. default_height)
    end
end

setkeymap('n', '<leader>t', ':lua ToggleResizeHeight()<CR>', { noremap = true, silent = true })
