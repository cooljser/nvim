return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'nvimdev/lspsaga.nvim',
  },
  config = function()
    require('mason').setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })

    require('lspsaga').setup({})

    -- Diagnostic 键映射设置
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- on_attach 函数：在 LSP 附加到缓冲区后映射键位
    local on_attach = function(_, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<space>rn', '<cmd>Lspsaga rename<CR>', bufopts)
      vim.keymap.set('n', '<space>ca', '<cmd>Lspsaga code_action<CR>', bufopts)
      vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<CR>', bufopts)
    end

    -- 获取默认的 capabilities
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- 特定语言服务器的配置
    local server_configs = {
      pylsp = {
        capabilities = capabilities,
        on_attach = on_attach,
      },
      tsserver = {
        capabilities = capabilities,
        filetypes = {
          'javascript',
          'javascriptreact',
          'javascript.jsx',
          'typescript',
          'typescriptreact',
          'typescript.tsx',
        },
        on_attach = on_attach,
      },
      lua_ls = {
        capabilities = capabilities,
        filetypes = { 'lua' },
        on_attach = on_attach,
      },
      cssmodules_ls = {
        capabilities = capabilities,
        on_attach = on_attach,
      },
      emmet_language_server = {
        capabilities = capabilities,
        on_attach = on_attach,
      },
      jdtls = {
        capabilities = capabilities,
        on_attach = on_attach,
      },
    }

    -- 使用 mason-lspconfig 的 handlers 自动配置服务器
    require('mason-lspconfig').setup({
      -- 自动安装的服务器列表
      ensure_installed = {
        'pylsp',
        'lua_ls',
        'rust_analyzer',
        'ts_ls',
        'cssmodules_ls',
        'emmet_language_server',
        'jdtls',
      },
      -- 使用 handlers 自动配置服务器（推荐方式）
      handlers = {
        -- 默认 handler：为所有服务器应用默认配置
        function(server_name)
          local config = server_configs[server_name] or {
            capabilities = capabilities,
            on_attach = on_attach,
          }
          require('lspconfig')[server_name].setup(config)
        end,
      },
    })
  end,
}
