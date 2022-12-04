vim.g.loaded_netrw = 1
vim.api.nvim_set_hl(0, 'DapBreakpoint', {fg = 'red'})
vim.fn.sign_define('DapBreakpoint', {text='', texthl='DapBreakPoint', linehl='', numhl=''})
vim.g.loaded_netrwPlugin = 1

vim.opt.guicursor = "a:block"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hidden = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50
vim.g.mapleader = " "
vim.opt.showmode = false
vim.opt.foldcolumn = '1'
vim.opt.clipboard = "unnamed"
