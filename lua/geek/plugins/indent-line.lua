return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  lazy = true,
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('ibl').setup({
      indent = { char = '▏' },
    })
  end,
}
