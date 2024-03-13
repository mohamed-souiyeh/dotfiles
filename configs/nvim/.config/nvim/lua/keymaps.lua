-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local map = function(mod, keys, func, opts)
  vim.keymap.set(mod, keys, func, opts)
end

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>xe', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NeoTree keymaps
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Toggel [E]xplorer Notree' })

-- NOTE: keymaps from lazyvim because i like them

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })

-- Clear search with <esc>
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- save file
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
map({ 'n' }, '<leader>ww', '<cmd>w<cr><esc>', { desc = 'Save file' })
map({ 'n' }, '<leader>wq', '<cmd>wq<cr><esc>', { desc = 'Save file and quit' })
map({ 'n' }, '<leader>wqa', '<cmd>wqa<cr><esc>', { desc = 'Save file and quit all' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Move Lines
map('n', '<C-S-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map('n', '<C-S-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('i', '<C-S-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<C-S-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('v', '<C-S-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
map('v', '<C-S-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next search result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev search result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- lazy
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- lazy git
map('n', '<leader>gg', '<cmd>LazyGitCurrentFile<cr>', { desc = 'LazyGit current file root dir' })
map('n', '<leader>gG', '<cmd>LazyGit<cr>', { desc = 'Lazygit (cwd)' })

-- new file
map('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })
-- highlights under cursor
map('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })
-- quit
map('n', '<leader>qa', '<cmd>qa<cr>', { desc = 'Quit all' })
map('n', '<leader>qq', '<cmd>q<cr>', { desc = 'Quit current window' })

-- highlights under cursor
map('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })

-- windows
-- map('n', '<leader>ww', '<C-W>p', { desc = 'Other window', remap = true })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete window', remap = true })
map('n', '<leader>w-', '<C-W>s', { desc = 'Split window below', remap = true })
map('n', '<leader>w|', '<C-W>v', { desc = 'Split window right', remap = true })
map('n', '<leader>-', '<C-W>s', { desc = 'Split window below', remap = true })
map('n', '<leader>|', '<C-W>v', { desc = 'Split window right', remap = true })

-- tabs
map('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last Tab' })
map('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First Tab' })
map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
map('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
map('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
map('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })

-- yanky keymaps
-- map({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)', { desc = 'yanky put after cursor' })
-- map({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)', { desc = 'yanky put before cursor' })
-- map({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)', { desc = 'yanky put after cursor and leave the cursor after' })
-- map({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)', { desc = 'yanky put before cursor and leave the cursor after' })
-- map({ 'n', 'x' }, 'y', '<Plug>(YankyYank)', { desc = 'yanky yank boi' })
-- map('n', '<c-p>', '<Plug>(YankyPreviousEntry)', { desc = 'previous yanky yank-ring entry' })
-- map('n', '<c-n>', '<Plug>(YankyNextEntry)', { desc = 'next yanky yank-ring enrty' })
