return {
  'phaazon/hop.nvim',
  config = function()
    require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    vim.api.nvim_command('highlight HopUnmatched guifg=none guibg=none guisp=none ctermfg=none')

    vim.keymap.set('n', '<leader>j', '<CMD>HopWord<CR>')
  end
}
