local ls = require("luasnip")

vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

ls.log.set_loglevel("info")
require("luasnip.loaders.from_vscode").lazy_load()

-- extend filetypes
ls.filetype_extend("typescript", {"javascript"})
ls.filetype_extend("typescriptreact", {"javascript"})
ls.filetype_extend("javascriptreact", {"javascript"})

-- custom snippets
-- local s = ls.snippet
-- local t = ls.text_node
-- local i = ls.insert_node

-- ls.add_snippets("lua", {
  -- s("hello", {
    -- t('print("hello world')
  -- })
-- })
