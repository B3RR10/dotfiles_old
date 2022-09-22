local exec = vim.api.nvim_command
local cmd, fn = vim.cmd, vim.fn

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  exec('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

cmd([[packadd packer.nvim]])

local packerGrp = vim.api.nvim_create_augroup('PackerAutoCompile', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*/lua/plugins/init.lua',
  command = [[source <afile> | PackerCompile]],
  group = packerGrp,
})

require('packer').startup({
  {
    --------------
    --  Packer  --
    --------------
    { 'wbthomason/packer.nvim', opt = true },

    ---------------
    --  Visuals  --
    ---------------
    {
      'rebelot/kanagawa.nvim',
      config = function()
        require('plugins.colorscheme').setup()
      end,
    },
    { 'kyazdani42/nvim-web-devicons' },
    {
      'hoob3rt/lualine.nvim',
      config = function()
        require('plugins.lualine').setup()
      end,
    },
    { 'akinsho/nvim-bufferline.lua' },

    -- Git
    { 'tpope/vim-fugitive' },
    { 'f-person/git-blame.nvim' },
    {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('plugins.gitsigns').setup()
      end,
    },

    -- Highlight word under cursor
    {
      'RRethy/vim-illuminate',
      config = function()
        require('plugins.illuminate').setup()
      end,
    },

    -----------------
    --  Filetypes  --
    -----------------
    -- C# - .NET
    {
      'OmniSharp/omnisharp-vim',
      config = function()
        require('plugins.omnisharp').setup()
      end,
    },

    -- Editorconfig
    { 'editorconfig/editorconfig-vim' },

    -- F#
    { 'ionide/Ionide-vim' },

    -- Git
    { 'tpope/vim-git' },

    -- HTML
    {
      'mattn/emmet-vim',
      config = function()
        require('plugins.emmet').setup()
      end,
    },

    -- justfile
    { 'NoahTheDuke/vim-just' },

    -- Lua
    { 'tjdevries/nlua.nvim' },

    -- Rust
    { 'rust-lang/rust.vim' },
    { 'simrat39/rust-tools.nvim' },

    -- Toml
    { 'cespare/vim-toml' },

    -- Vim
    { 'Shougo/neco-vim' },
    { 'Shougo/neco-syntax' },

    ------------------------
    --  LSP & Completion  --
    ------------------------
    {
      'williamboman/mason.nvim',
      requires = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
      },
      config = function()
        require('plugins.mason').setup()
      end,
    },
    {
      'neovim/nvim-lspconfig',
      after = { 'mason.nvim', 'Ionide-vim' },
      config = function()
        require('plugins.lsp').setup()
      end,
      requires = {
        'b0o/schemastore.nvim',
      },
    },
    {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-emoji',
        'ray-x/cmp-treesitter',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-omni',
        'onsails/lspkind-nvim',
      },
      config = function()
        require('plugins.cmp').setup()
      end,
    },
    {
      'mhartington/formatter.nvim',
      config = function()
        require('plugins.formatter').setup()
      end,
    },
    {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'p00f/nvim-ts-rainbow',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'JoosepAlviste/nvim-ts-context-commentstring',
      },
      run = ':TSUpdate',
      config = function()
        require('plugins.treesitter').setup()
      end,
    },
    {
      'liuchengxu/vista.vim',
      config = function()
        require('plugins.vista').setup()
      end,
    },

    --------------
    --  Editor  --
    --------------
    -- Alignment tool
    { 'godlygeek/tabular' },

    -- Multiple cursors
    { 'terryma/vim-multiple-cursors' },

    -- See cursor jump
    {
      'danilamihailov/beacon.nvim',
      config = function()
        require('plugins.beacon').setup()
      end,
      event = 'VimEnter',
    },

    -- Snippets
    {
      'L3MON4D3/LuaSnip',
      tag = 'v1.*',
      requires = {
        'honza/vim-snippets',
        'rafamadriz/friendly-snippets',
      },
      config = function()
        require('plugins.luasnip').setup()
      end,
    },

    -- mini.nvim
    {
      'echasnovski/mini.nvim',
      config = function()
        require('plugins.mini').setup()
      end,
    },

    -- Surroundings
    {
      'jiangmiao/auto-pairs',
      config = function()
        require('plugins.autopairs').setup()
      end,
    },

    -- Save persistent sessions
    {
      'rmagatti/auto-session',
      config = function()
        require('plugins.auto-session').setup()
      end,
    },

    -- Enhance vim.ui interface
    {
      'stevearc/dressing.nvim',
      config = function()
        require('dressing').setup()
      end,
    },

    -- Auto shriks windows when not enough space
    {
      'anuvyklack/windows.nvim',
      requires = {
        'anuvyklack/middleclass',
        'anuvyklack/animation.nvim',
      },
      config = function()
        require('plugins.windows').setup()
      end,
    },

    -------------
    --  Tools  --
    -------------
    -- Git mergetool
    { 'whiteinge/diffconflicts' },

    -- Fuzzy finder
    {
      'junegunn/fzf.vim',
      config = function()
        require('plugins.fzf').setup()
      end,
    },

    -- Zen mode
    {
      'folke/zen-mode.nvim',
      requires = { 'folke/twilight.nvim' },
      config = function()
        require('plugins.zen_mode').setup()
      end,
    },

    -- HTTP Client
    {
      'NTBBloodbath/rest.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      ft = { 'http' },
      config = function()
        require('plugins.rest').setup()
      end,
    },

    -- Neovim tree
    {
      'kyazdani42/nvim-tree.lua',
      config = function()
        require('plugins.neovim_tree').setup()
      end,
    },

    -- Nvim colorizer #666666
    {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('colorizer').setup()
      end,
    },

    {
      'jbyuki/venn.nvim',
      config = function()
        require('plugins.venn').setup()
      end,
    },

    {
      'mickael-menu/zk-nvim',
      config = function()
        require('plugins.zk').setup()
      end,
    },

    ------------
    --  Misc  --
    ------------
    -- Toggle quickfix with \q and location list with \l
    { 'milkypostman/vim-togglelist' },
{%@@ if profile == "laptop" or profile == "desktop" @@%}

    -- Turn off caps when change from insert to normal mode
    { 'suxpert/vimcaps' },
{%@@ endif @@%}
  },
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
  },
})

-- vim: foldmethod=marker
