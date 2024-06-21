return {
  'gbprod/yanky.nvim',
  lazy = true,
  config = function ()
    require("yanky").setup({
      ring = {
        history_length = 100,
        storage = "shada",
        sync_with_numbered_registers = true,
        cancel_event = "update",
        ignore_registers = { "_" },
      },
      system_clipboard = {
        sync_with_ring = true,
      },
      preserve_cursor_position = {
        enabled = true,
      },
      highlight = {
        on_put = false,
        on_yank = false,
        timer = 500,
      },
    })

    vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
    vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
    vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
    vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

    vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
    vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

    vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
  end
}

