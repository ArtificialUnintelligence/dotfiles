local nnoremap = require("keymap").nnoremap
local inoremap = require("keymap").inoremap
local tnoremap = require("keymap").tnoremap
local snoremap = require("keymap").snoremap
local vnoremap = require("keymap").vnoremap
local imap = require("keymap").imap

nnoremap("J", "mzJ`z")
nnoremap("zz", ":update<Cr>")

inoremap("<C-c>","<esc>")
nnoremap("<C-c>", "<silent> <C-c>")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
inoremap("<C-v>", "<C-r><C-p>*")
nnoremap("<leader>w", "<C-^>")
nnoremap("Y", "y$")

-- Telescope
nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').find_files{ path_display = { 'tail' } }<cr>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers{ path_display = { 'tail' } }<cr>")
nnoremap("<leader>fe", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>")
nnoremap("<leader>lg", "<cmd>lua require('telescope.builtin').live_grep{ path_display = { 'tail' }, disable_coordinates = true }<cr>")
nnoremap("<leader>ht", "<cmd>:Telescope help_tags<cr>")

nnoremap("<leader>gs", ":G<cr>")
nnoremap("<leader>gc", ":G commit<cr>")
nnoremap("<leader>gk", ":G push<cr>")
nnoremap("<leader>gj", ":G pull<cr>")
nnoremap("<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>")
nnoremap("<leader>gp", 'yiw:G cherry-pick <C-r>"<cr>')
nnoremap("<leader>gl", ":G log<cr>")
nnoremap("<leader>gt", ":G stash<cr>")
nnoremap("<leader>gr", 'yiw:G reset --soft <C-r>"<cr>')
nnoremap("<leader>gx", 'yiw:G reset --hard<cr>')

-- Luasnip
vim.keymap.set('i', '<Tab>', function()
    return require('luasnip').expand_or_jumpable() == 1 and "<Plug>luasnip-expand-or-jump" or "<Tab>" end, { silent = true, expr = true})
inoremap("<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<Cr>")
snoremap("<Tab>", "<cmd>lua require'luasnip'.jump(1)<Cr>")
snoremap("<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<Cr>")

-- navigate windows
tnoremap("<A-h>", "<C-\\><C-N><C-w>h")
tnoremap("<A-j>", "<C-\\><C-N><C-w>j")
tnoremap("<A-k>", "<C-\\><C-N><C-w>k")
tnoremap("<A-l>", "<C-\\><C-N><C-w>l")
inoremap("<A-h>", "<C-\\><C-N><C-w>h")
inoremap("<A-j>", "<C-\\><C-N><C-w>j")
inoremap("<A-k>", "<C-\\><C-N><C-w>k")
inoremap("<A-l>", "<C-\\><C-N><C-w>l")
nnoremap("<A-h>", "<C-w>h")
nnoremap("<A-j>", "<C-w>j")
nnoremap("<A-k>", "<C-w>k")
nnoremap("<A-l>", "<C-w>l")

-- Terminal
tnoremap("<C-c>", "<C-\\><C-n>")
tnoremap("<C-d>", "<C-c>")
