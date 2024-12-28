-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "
vim.g.mapgloballeader = " "

local opt = vim.opt

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.mouse = ""
opt.number = true
opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.backup = false
opt.hlsearch = true
opt.showcmd = true
opt.errorbells = false
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.shell = "fish"
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.inccommand = "split"
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.smarttab = true
opt.breakindent = true
opt.clipboard = "unnamedplus"
opt.tabstop = 2
opt.wrap = false
opt.smartcase = true
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })
opt.hlsearch = false
opt.swapfile = false

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })

vim.o.shell = '/bin/zsh'
vim.o.relativenumber = true
vim.o.laststatus = 2
