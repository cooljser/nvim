-------------------------------------------------
-- DT'S NEOVIM CONFIGURATION
-- Neovim website: https://neovim.io/
-- DT's dotfiles: https://gitlab.com/dwt1/dotfiles
-------------------------------------------------

-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------

local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

-- Basic map
map('n', 'qq', '<CMD>q!<CR>')
map('n', '<leader>qq', '<CMD>qa!<CR>')
map('n', '<leader><cr>', '<CMD>noh<CR>')
map('n', '<leader>w', '<CMD>wa<CR>')

map('n', '<leader>tn', '<CMD>tabnew<CR>')
map('n', '<leader>1', '1gt<CR>')
map('n', '<leader>2', '2gt<CR>')
map('n', '<leader>3', '3gt<CR>')
map('n', '<leader>ev', '<CMD>:vs ~/.config/nvim/init.lua<CR>')
map('n', '<leader>r', '<CMD>e!<CR>')
map('n', 'H', '^')
map('n', 'yH', 'y^')
map('n', 'dh', 'd^')
map('n', 'L', '$')
map('n', 'yL', 'y$')
map('n', 'dl', 'd$')
map('n', 'M', '%')

-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

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
map('n', '<leader>d', '<CMD>Git<CR>')
map('n', '<leader>h', '<CMD>DiffviewFileHistory<CR>')
map('n', '<leader>ch', '<CMD>DiffviewFileHistory %<CR>')
map('n', '<leader>gd', '<CMD>DiffviewOpen<CR>')
map('n', '<leader>gc', '<CMD>DiffviewClose<CR>')

-- Fzf
--map('n', "<C-f>", "<CMD>FzfLua files<CR>")
-- map("n", "<C-f>", "<CMD>Telescope find_files<CR>")
-- map("n", "<leader>ft", "<CMD>FzfLua colorschemes<CR>")

-- Auto log
map('n', '<leader>l', '"ayiwoconsole.log(\'<C-R>a:\', <C-R>a);<Esc>')
