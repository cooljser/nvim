local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local filetypes = {
  "css",
  "graphql",
  "html",
  "javascript",
  "javascriptreact",
  "json",
  "less",
  "markdown",
  "scss",
  "typescript",
  "typescriptreact",
  "yaml",
}

local nl = require("null-ls")
local sources = {
  nl.builtins.formatting.black,
  nl.builtins.formatting.stylua.with({
    extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
  }),
  nl.builtins.formatting.prettierd.with({
    filetypes = filetypes,
    extra_args = {
      "--arrow-parens=always",
      "--print-width=80",
      "--single-quote",
      "--bracket-spacing=false",
      "--semi=true",
      "--trailing-comma=es5",
      "--use-tabs=false",
    },
  }),
}
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.keymap.set("n", "<Leader>f", function()
      vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
    end, { buffer = bufnr, desc = "[lsp] format" })

    -- format on save
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          filter = function(_client)
            return _client.name == "null-ls"
          end,
        })
      end,
      desc = "[lsp] format on save",
    })
  end
end

nl.setup({
  sources = sources,
  on_attach = on_attach,
})

local prettier = require("prettier")

prettier.setup({
  bin = "prettierd", -- or `'prettierd'` (v0.23.3+)
  filetypes = filetypes,
  cli_options = {
    arrow_parens = "always",
    bracket_spacing = false,
    bracket_same_line = false,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    -- jsx_bracket_same_line = false,
    jsx_single_quote = false,
    print_width = 80,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = true,
    single_attribute_per_line = false,
    single_quote = true,
    tab_width = 2,
    trailing_comma = "es5",
    use_tabs = false,
    vue_indent_script_and_style = false,
  },
})
