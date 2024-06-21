return {
  'Exafunction/codeium.vim',
  enabled = true,
  tag = "1.8.37",
  event = 'BufEnter',
  config = function()
    vim.g.codeium_idle_delay = 100
  end
}
