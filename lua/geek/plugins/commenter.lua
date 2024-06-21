return {
  'preservim/nerdcommenter',
  config = function()
    local g = vim.g
    -- Add spaces after comment delimeters
    g.NERDSpaceDelims = 1
    -- Use compact syntax for prettified multi-line comments
    g.NERDCompactSexyComs = 0
  end
}
