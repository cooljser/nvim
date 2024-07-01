local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

-- Basic map
map('n', 'qq', '<CMD>q!<CR>')
map('n', '<leader>qq', '<CMD>qa!<CR>')
map('n', '<leader><cr>', '<CMD>noh<CR>')
map('n', '<leader>w', '<CMD>wa<CR>')

-- Tab switch map
map('n', '<leader>tn', '<CMD>tabnew<CR>')
map('n', '<leader>1', '1gt<CR>')
map('n', '<leader>2', '2gt<CR>')
map('n', '<leader>3', '3gt<CR>')

map('n', 'H', '^')
map('n', 'yH', 'y^')
map('n', 'dh', 'd^')
map('n', 'L', '$')
map('n', 'yL', 'y$')
map('n', 'dl', 'd$')
map('n', 'M', '%')

-- Smart way to move between windows
map('n', '<C-j>', '<C-W>j')
map('n', '<C-k>', '<C-W>k')
map('n', '<C-h>', '<C-W>h')
map('n', '<C-l>', '<C-W>l')

-- Ack
--vim.keymap.set("n", "<leader>g", ":Ack!<Space>", { silent = false })

-- Run javascript
map('n', '<F5>', '<CMD>!node %<CR>')
map('n', '<F2>', '<CMD>Git blame<CR>')

-- Git diffview
-- map('n', '<leader>d', '<CMD>Git<CR>')
-- map('n', '<leader>h', '<CMD>DiffviewFileHistory<CR>')
-- map('n', '<leader>ch', '<CMD>DiffviewFileHistory %<CR>')
-- map('n', '<leader>gd', '<CMD>DiffviewOpen<CR>')
-- map('n', '<leader>gc', '<CMD>DiffviewClose<CR>')

-- Auto log
map('n', '<leader>l', '"ayiwoconsole.log(\'<C-R>a:\', <C-R>a);<Esc>')
