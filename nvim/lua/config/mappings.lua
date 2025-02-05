-- Keymaps miscellaneous
vim.keymap.set('n', ';', ':')
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set({'n', 'i'}, '<C-c>', ':%yank<CR>')
vim.keymap.set('v', '<C-c>', 'y')
vim.keymap.set({'n', 'i', 'v'}, '<C-s>', '<ESC>:w<CR>')
vim.keymap.set({'n', 'i', 'v'}, '<C-x>', '<ESC>:wq<CR>')
vim.keymap.set({'n', 'i', 'v'}, '<C-q>', '<ESC>:q<CR>')
vim.keymap.set('n', '<ESC>', ':nohlsearch<CR>')
vim.keymap.set('n', '<Leader>fm', ':%s/\\s\\+$//e | %s/\\n\\{3,}/\\r\\r/ge <CR> gg=G`')
vim.keymap.set('n', '<Leader>fn', ':w<CR> :!c_formatter_42 %<CR><CR> :nohlsearch<CR>')

-- Keymaps neotree
vim.keymap.set('n', '<Leader>t', ':Neotree<CR>')
vim.keymap.set('n', '<Leader>e', ':Neotree reveal<CR>')

-- Keymaps telescope
vim.keymap.set('n', '<Leader>fa', ':Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>fo', ':Telescope oldfiles<CR>')
vim.keymap.set('n', '<Leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<Leader>fb', ':Telescope buffers<CR>')

-- Keymaps bufferline
vim.keymap.set('n', '<Leader>bn', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>bp', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>bd', ':bdelete<CR>', { noremap = true, silent = true })

function NorminetteQuickfixTelescope()
	vim.cmd("!python3 ~/.config/nvim/parse.py > /tmp/quickfix_list.lua")
	vim.cmd("cfile /tmp/quickfix_list.lua")
	require('telescope.builtin').quickfix()
end

function NorminetteQuickfixDirect()
	vim.cmd("silent! !python3 ~/.config/nvim/parse.py > /tmp/quickfix_list.lua")
	vim.cmd("cfile /tmp/quickfix_list.lua")
	vim.cmd("vert rightbelow copen")
	vim.cmd("vertical resize 80")
end

vim.keymap.set('n', '<Leader>q', ':lua NorminetteQuickfixTelescope()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>Q', ':lua NorminetteQuickfixDirect()<CR>', { noremap = true, silent = true })

-- Keymaps 42header
vim.keymap.set('n', '<Leader>h', ':Stdheader<CR>')
