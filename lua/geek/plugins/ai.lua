return {
  'Exafunction/codeium.vim',
  enabled = true,
  tag = '1.8.37',
  event = 'BufEnter',
  config = function()
    vim.g.codeium_idle_delay = 100

    -- set keymaps
    local keymap = vim.keymap

    keymap.set('i', '<C-c>', '<ESC>:call codeium#Clear()<CR>', { noremap = true, silent = true })
  end,
}
