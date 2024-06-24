return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    local function my_on_attach(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
    end

    local glyphs = {
      default = '',
      symlink = '',
      git = {
        unstaged = '',
        staged = 'S',
        unmerged = '',
        renamed = '➜',
        deleted = '',
        untracked = 'U',
        ignored = '◌',
      },
      folder = {
        default = '',
        open = '',
        empty = '',
        empty_open = '',
        symlink = '',
      },
    }

    -- OR setup with some options
    require('nvim-tree').setup({
      on_attach = my_on_attach,
      auto_reload_on_write = true,
      sort_by = 'case_sensitive',
      update_cwd = true,
      update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
      },
      view = {
        width = 40,
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            modified = true,
          },
          glyphs = glyphs,
        },
      },
      filters = {
        dotfiles = true,
      },
    })

    -- set keymaps
    vim.keymap.set('n', '<leader>nn', '<CMD>NvimTreeToggle<CR>')
    vim.keymap.set('n', '<leader>nf', '<CMD>NvimTreeFindFile<CR>')
  end,
}
