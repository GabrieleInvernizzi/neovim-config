-- General options 
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false 	-- check
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 15
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.pumheight = 10
vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize"

-- Global settings
vim.g.mapleader = ' '

-- Used for plugins
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.showmode = false
-- Cmp
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }


