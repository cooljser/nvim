local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- 'rafi/awesome-vim-colorschemes',
  -- 'navarasu/onedark.nvim',
  -- 'projekt0n/github-nvim-theme',
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      transparent_sidebar = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      }
    },
  },
  'nvim-tree/nvim-tree.lua',
  'tpope/vim-surround',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    event = 'VeryLazy'
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim'
    },
    event = 'VimEnter'
  },
  'phaazon/hop.nvim',
  'booperlv/nvim-gomove',
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    event = 'BufWinEnter'
  },
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "onsails/lspkind.nvim",
    event = { "VimEnter" },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
      "hrsh7th/cmp-buffer",   -- buffer auto-completion
      "hrsh7th/cmp-path",     -- path auto-completion
      "hrsh7th/cmp-cmdline",  -- cmdline auto-completion
    },
    config = function()
      require("plugins.nvim-cmp")
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end
  },
  {
    'MunifTanjim/prettier.nvim',
    dependencies = {
      'nvimtools/none-ls.nvim'
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = "BufReadPost",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    lazy = true
  },
  'saadparwaiz1/cmp_luasnip',
  'echasnovski/mini.pairs',
  'preservim/nerdcommenter',
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead'
  },
  {
    'akinsho/toggleterm.nvim',
    lazy = true
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    'gbprod/yanky.nvim',
    lazy = true
  },
  'keaising/im-select.nvim',
  'Shatur/neovim-session-manager',
  -- {
  -- "ibhagwan/fzf-lua",
  -- config = function()
  -- require("fzf-lua").setup({})
  -- end
  -- },
  'ap/vim-css-color',
  'itchyny/vim-cursorword',
  {
    'Exafunction/codeium.vim',
    enabled = true,
    tag = "1.8.37",
    event = 'BufEnter',
    config = function()
      vim.g.codeium_idle_delay = 100
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    lazy = true
  },
  'dstein64/vim-startuptime',
  {
    "rcarriga/nvim-notify",
    event = 'VimEnter'
  },
})
