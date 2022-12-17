local nnoremap = require("keymap").nnoremap
local inoremap = require("keymap").inoremap
local tnoremap = require("keymap").tnoremap
local snoremap = require("keymap").snoremap
local vnoremap = require("keymap").vnoremap
local imap = require("keymap").imap

nnoremap("J", "mzJ`z")
nnoremap("zz", ":up<Cr>")

inoremap("<C-c>","<esc>")
nnoremap("<C-c>", "<silent> <C-c>")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<leader>w", "<C-^>")
nnoremap("<leader>bd", ":bd<cr>")
nnoremap("Y", "y$")
-- Deletes all buffers but the current one
nnoremap("<leader>bx", ":up <bar> %bd <bar> e# <bar> bd# <Cr><Cr>")

-- Telescope
nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').find_files{ path_display = { 'tail' } }<cr>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers{ path_display = { 'tail' } }<cr>")
nnoremap("<leader>fe", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>")
nnoremap("<leader>lg", "<cmd>lua require('telescope.builtin').live_grep{ path_display = { 'tail' }, disable_coordinates = true }<cr>")
nnoremap("<leader>ht", "<cmd>:Telescope help_tags<cr>")

-- Git remaps
nnoremap("<leader>gs", ":G<cr>")
nnoremap("<leader>gc", ":G commit<cr>")
nnoremap("<leader>gk", ":G push<cr>")
nnoremap("<leader>gj", ":G pull<cr>")
nnoremap("<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>")
nnoremap("<leader>gl", ":G log<cr>")
nnoremap("<leader>gt", ":G stash<cr>")
nnoremap("<leader>gx", ':G reset --hard<cr>')
nnoremap("<leader>cc", 'yiw:G cherry-pick <C-r>"<cr>')
nnoremap("<leader>cr", 'yiw:G reset --soft <C-r>"<cr>')
nnoremap("<leader>cu", 'yiw:G revert <C-r>"<cr>')

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
tnoremap("<C-d>", "<C-c>")
nnoremap("<leader>ts", ':TermExec cmd="rm -rf ../tomcat/webapps/*;rm -rf ../tomcat/temp/*;mvn clean package -Dmaven.test.skip;cp target/*.war ../tomcat/webapps;../tomcat/bin/catalina.sh run"<cr>')
nnoremap("<leader>tf", ":TermExec cmd='FILENAME=$(basename target/*.war | cut -f 1 -d '.');cp -rf src/main/webapp/WEB-INF/views/* ../tomcat/webapps/$FILENAME/WEB-INF/views/; cp -rf src/main/webapp/assets/* ../tomcat/webapps/$FILENAME/assets/'<cr>")
nnoremap("<leader>tw", ":TermExec cmd='cp target/*.war ../tomcat/webapps'<cr>")
nnoremap("<leader>mb", ":TermExec cmd='mvn clean package -Dmaven.test.skip'<cr>")
nnoremap("<leader>js", ":TermExec cmd='rm -rf ../wildfly/standalone/deployments/*;rm -rf ../wildfly/standalone/tmp/*;mvn clean package -Dmaven.test.skip;FILENAME=$(basename target/*.war);unzip -q target/$FILENAME -d ../wildfly/standalone/deployments/$FILENAME/;touch ../wildfly/standalone/deployments/$FILENAME.dodeploy;../wildfly/bin/standalone.sh'<cr>")
nnoremap("<leader>jf", ":TermExec cmd='FILENAME=$(basename target/*.war);cp -rf src/main/webapp/* ../wildfly/standalone/deployments/$FILENAME/'<cr>")
