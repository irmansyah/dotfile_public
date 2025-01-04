-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd("autocmd!")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])


local no_insert_directories = { '/home/mane/.development', '/home/mane/.pub-cache', '/home/mane/.cargo',
  '/home/mane/.rustup' }

_G.my_config = {}

function _G.my_config.check_no_insert()
  local isNoInsertDirectory = false

  local current_directory = vim.fn.expand('%:p:h')

  for _, dir in ipairs(no_insert_directories) do
    if string.find(current_directory, dir, 1, true) then
      isNoInsertDirectory = true
      break
    end
  end

  if isNoInsertDirectory then
    vim.cmd('set readonly')
    vim.cmd('set nomodifiable')
    vim.cmd('stopinsert')
  else
    vim.cmd('set noreadonly')
    vim.cmd('set modifiable')
  end
end

vim.api.nvim_exec([[
  augroup NoInsertModeFiles
    autocmd!
    autocmd BufReadPost,InsertEnter,BufRead,BufNewFile * lua _G.my_config.check_no_insert()
  augroup END
]], false)

vim.cmd [[
  " Enter Normal mode from terminal mode
  tnoremap <Esc> <C-\><C-n>

  " Use Vim-style navigation in terminal mode
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

  " Resize splits in terminal mode
  tnoremap <C-Up> <C-\><C-n>:resize +2<CR>
  tnoremap <C-Down> <C-\><C-n>:resize -2<CR>
  tnoremap <C-Left> <C-\><C-n>:vertical resize -2<CR>
  tnoremap <C-Right> <C-\><C-n>:vertical resize +2<CR>

  " Easy exit from terminal to close terminal window
  tnoremap <C-q> <C-\><C-n>:q!<CR>

]]
