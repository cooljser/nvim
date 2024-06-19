-- Lua
-- require('onedark').setup {
-- style = 'darker',
-- lualine = {
-- transparent = true
-- }
-- }

-- define your colorscheme here
-- local colorscheme = 'onedark'
-- local colorscheme = 'onehalflight'
-- local colorscheme = 'github_light_default'
local colorscheme = 'tokyonight-moon'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end

-- require('onedark').load()
-- vim.api.nvim_set_hl(0, "CursorWord", { bg = '#454b59', underline = false })
vim.api.nvim_set_hl(0, "CursorWord", { bg = '#454b59', underline = false })
vim.api.nvim_set_hl(0, "CursorLine", { bg = '#373D4B' })

-- vim.api.nvim_set_hl(0, "CursorWord", { bg = '#b4dbfd', underline = false })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = '#f5f6f8' })
