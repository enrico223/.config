local set = vim.api.nvim_set_keymap
local map = vim.keymap.set

vim.g.mapleader = " "

vim.cmd(':set nohlsearch') 
map('n', '<F1>', ':set foldmethod=expr<cr>')

--set colorscheme and background color 
map('n', '<leader>d', ':set background=dark<cr>')
map('n', '<leader>l', ':set background=light<cr>')
map('n', '<leader>t', ':hi Normal guibg=NONE ctermbg=NONE<cr>')
map('n', '<leader>cl', require('telescope.builtin').colorscheme, {})

--save with shortcut
map('i', '<F2>', '<Esc>:w<CR>i', {noremap = true, silent = false})

--Keybindings for tab navigation with leader and number
map('n', '<leader>1', '1gt', {noremap = true, silent = false})
map('n', '<leader>2', '2gt', {noremap = true, silent = false})
map('n', '<leader>3', '3gt', {noremap = true, silent = false})
map('n', '<leader>4', '4gt', {noremap = true, silent = false})

--open and close folds with leader
map('n', '<leader><leader>', 'za', {noremap = true, silent = false})
map('n', '<leader>py', ':w<CR> :!python %<CR>', {noremap = true, silent = false})

--moving between tabs and splits
map('n', 'th', ':tabnext<CR>', {noremap = true, silent = false})
map('n', 'tl', ':tabprev<CR>', {noremap = true, silent = false})
map('n', 'tn', ':tabnew<CR>', {noremap = true, silent = false})
map('n', '<C-J>', '<C-W><C-J>', {noremap = true, silent = false})
map('n', '<C-K>', '<C-W><C-K>', {noremap = true, silent = false})
map('n', '<C-L>', '<C-W><C-L>', {noremap = true, silent = false})
map('n', '<C-H>', '<C-W><C-H>', {noremap = true, silent = false})

map('v', 'y', 'y:call system("wl-copy", @@)<CR> ', {noremap = false, silent = true})
map('i', 'jj', '<esc>', {noremap = true, silent = false})

-- Find files using Telescope command-line sugar.
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {}, {hidden = true})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>bf', builtin.buffers, {})
map('n', '<leader>h', builtin.help_tags, {})
map('n', '<leader>sc', builtin.keymaps, {})
map("n", "<leader>fn", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})
map('n', '<leader>fl', ":Telescope file_browser<cr>", {})

-- Cheat.sh plugin 
map('n', '<leader>cs', ':Cheat<cr>')

--Netrw shortcut
map('n', '<leader>fm', ":Explore<cr>", {})
map('n', '<leader>ob', ":Explore /home/enrico/Documents/obsidian_vaults/<cr>", {})

-- Move 1 more lines up or down in normal and visual selection modes.
map('v', 'K', ':m <-2<CR>gv=g', {noremap = true, silent = false})
map('v', 'J', ':m >+1<CR>gv=gv', {noremap = true, silent = false})

--logical cursor positioning on lines 
--map('n', 'j', 'gj', {noremap = true, silent = false})
--map('n', 'k', 'gk', {noremap = true, silent = false})

--autocompletion for file names 
map('i', '<C-F>', '<C-X><C-F>', {noremap = true, silent = false})

--autocompletion with dictionary 
map('i', '<C-K>', '<C-X><C-K> ', {noremap = true, silent = false})
map('i', '<C-L>', '<Esc>[s1z=`]a', {noremap = true, silent = false})

--autocompletion for bibliography
map('i', '<C-B>', '<C-X><C-O>', {noremap = true, silent = false}) 

--pairing character
--map('i', '(', '()<Esc>i', {noremap = true, silent = false})
--map('i', '{', '{}<Esc>i', {noremap = true, silent = false})
--map('i', '[', '[]<Esc>i', {noremap = true, silent = false})
--map('i', '<', '<><Esc>i', {noremap = true, silent = false})
--map('i', '"', '""<Esc>i', {noremap = true, silent = false})

--latex shortcuts
map('n', '<leader>tt', ':VimtexTocToggle<CR>', {noremap = true, silent = false})
map('n', '<leader>la', ':VimtexContextMenu<CR>2', {noremap = true, silent = false})
 
--"""""""""""""""""
-- KNAP functions "
--"""""""""""""""""
-- set shorter name for keymap function
local kmap = vim.keymap.set

-- F5 processes the document once, and refreshes the view
kmap({ 'n', 'v', 'i' },'<F5>', function() require("knap").process_once() end)

-- F6 closes the viewer application, and allows settings to be reset
kmap({ 'n', 'v', 'i' },'<F6>', function() require("knap").close_viewer() end)

-- F7 toggles the auto-processing on and off
kmap({ 'n', 'v', 'i' },'<F7>', function() require("knap").toggle_autopreviewing() end)

-- F8 invokes a SyncTeX forward search, or similar, where appropriate
kmap({ 'n', 'v', 'i' },'<F8>', function() require("knap").forward_jump() end)

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end
--ALE kind of an lsp
map('n', '<leader>sg', ':ALEToggleBuffer<CR>', {noremap = true, silent = false})

-- macro for remappings f li'<Esc>f i',kr'<Esc>A', {noremap = true, silent = falsekr)<Esc>j0

