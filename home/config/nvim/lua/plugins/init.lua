local exec = vim.api.nvim_command
local cmd, fn = vim.cmd, vim.fn

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  exec('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

cmd([[packadd packer.nvim]])
cmd('au BufWritePost packages.lua PackerCompile')

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
      'romainl/Apprentice',
      branch = 'fancylines-and-neovim',
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

    -- Show intentation guides
    {
      'nathanaelkane/vim-indent-guides',
      config = function()
        require('plugins.indent_guides').setup()
      end,
    },

    ------------------------
    --  LSP & Completion  --
    ------------------------
    { 'neovim/nvim-lspconfig' },
    {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'quangnguyen30192/cmp-nvim-ultisnips',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-calc',
        'f3fora/cmp-spell',
        'hrsh7th/cmp-emoji',
        'ray-x/cmp-treesitter',
        'hrsh7th/cmp-cmdline',
        'onsails/lspkind-nvim',
      },
      config = function()
        require('plugins.cmp').setup()
      end,
    },
    {
      'w0rp/ale',
      config = function()
        require('plugins.ale').setup()
      end,
    },
    {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'romgrk/nvim-treesitter-context',
        'p00f/nvim-ts-rainbow',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'JoosepAlviste/nvim-ts-context-commentstring',
        'nvim-treesitter/playground',
      },
      run = ':TSUpdate',
      config = function()
        require('plugins.treesitter').setup()
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

    -- Markdown
    --{ 'tpope/vim-markdown' },

    -- Rust
    { 'rust-lang/rust.vim' },
    { 'simrat39/rust-tools.nvim' },

    -- Toml
    --{ 'cespare/vim-toml' },

    -- Vim
    { 'Shougo/neco-vim' },
    { 'Shougo/neco-syntax' },

    --------------
    --  Editor  --
    --------------
    -- Alignment tool
    { 'godlygeek/tabular' },

    -- Comments
    { 'tpope/vim-commentary' },

    -- Motions
    {
      'easymotion/vim-easymotion',
      config = function()
        require('plugins.easymotion').setup()
      end,
    },

    -- Multiple cursors
    { 'terryma/vim-multiple-cursors' },

    -- Smooth scrolling
    {
      'karb94/neoscroll.nvim',
      config = function()
        require('neoscroll').setup()
      end,
    },

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
      'SirVer/ultisnips',
      requires = { { 'honza/vim-snippets', rtp = '.' } },
      config = function()
        require('plugins.ultisnips').setup()
      end,
    },

    -- Surroundings
    {
      'jiangmiao/auto-pairs',
      config = function()
        require('plugins.autopairs').setup()
      end,
    },
    { 'tpope/vim-surround' },

    -- Add more vim objects
    { 'wellle/targets.vim' },
    { 'tpope/vim-unimpaired' },

    -- Save persistent sessions on a workspace
    {
      'thaerkh/vim-workspace',
      config = function()
        require('plugins.workspace').setup()
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
