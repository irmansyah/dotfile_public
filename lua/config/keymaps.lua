-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local setkeymap = vim.api.nvim_set_keymap

setkeymap("n", "<leader>h", ":wincmd h <CR>", { silent = true })
setkeymap("n", "<leader>j", ":wincmd j <CR>", { silent = true })
setkeymap("n", "<leader>k", ":wincmd k <CR>", { silent = true })
setkeymap("n", "<leader>l", ":wincmd l <CR>", { silent = true })

function ToggleResize()
    local current_height = vim.api.nvim_win_get_width(0)
    local default_width = 32
    local double_width = 64

    if current_height == default_width then
        vim.cmd('vertical resize ' .. double_width)
    else
        vim.cmd('vertical resize ' .. default_width)
    end
end
setkeymap('n', '<leader>t', ':lua ToggleResize()<CR>', { noremap = true, silent = true })
