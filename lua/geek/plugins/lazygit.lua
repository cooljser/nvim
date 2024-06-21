return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  event = 'BufWinEnter',
  config = function()
    -- set keymaps
    local keymap = vim.keymap

    keymap.set('n', '<leader>g', '<CMD>LazyGit<CR>', { desc = 'Open LazyGit' })
  end,
}
