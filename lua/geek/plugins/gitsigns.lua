return {
  'lewis6991/gitsigns.nvim',
  event = 'BufRead',
  config = function()
    require('gitsigns').setup {
      current_line_blame = true,
      current_line_blame_opts = { delay = 1000 }
    }
  end
}

