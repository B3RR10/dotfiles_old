local exec = vim.api.nvim_command
local cmd, fn = vim.cmd, vim.fn

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  exec('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

cmd [[packadd packer.nvim]]
cmd 'au BufWritePost packages.lua PackerCompile'

require('packer').startup {
  {
    --------------
    --  Packer  --
    --------------
    { 'wbthomason/packer.nvim', opt = true },

    ------------------
    --  Visuals  --
    ------------------
    { 'romainl/Apprentice', branch = 'fancylines-and-neovim' },
    { 'dominikduda/vim_current_word' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'hoob3rt/lualine.nvim' },
    -- { 'bling/vim-bufferline' },
    { 'akinsho/nvim-bufferline.lua' },

    -- Git
    { 'tpope/vim-fugitive' },
    { 'airblade/vim-gitgutter' },

    -- Show intentation guides
    { 'mengelbrecht/lightline-bufferline' },

    ------------------------
    --  LSP & Completion  --
    ------------------------
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/nvim-compe' },
    { 'w0rp/ale' },

    -----------------
    --  Filetypes  --
    -----------------
    -- C# - .NET
    { 'OmniSharp/omnisharp-vim' },

    -- Editorconfig
    { 'editorconfig/editorconfig-vim' },

    -- Git
    { 'tpope/vim-git' },

    -- HTML
    { 'mattn/emmet-vim' },

    -- Latex plugins
    --{ 'lervag/vimtex' },
    --{ 'matze/vim-tex-fold' },

    -- Lua
    { 'tjdevries/nlua.nvim' },

    -- Markdown
    --{ 'tpope/vim-markdown' },

    -- Rust
    --{ 'rust-lang/rust.vim' },
    --{ 'arzg/vim-rust-syntax-ext' },
    --{ 'racer-rust/vim-racer' },

    -- Toml
    --{ 'cespare/vim-toml' },

    -- Vim
    { 'Shougo/neco-vim' },
    { 'Shougo/neco-syntax' },

    -- Yaml
    { 'avakhov/vim-yaml' },

    --------------
    --  Editor  --
    --------------
    -- Alignment tool
    { 'godlygeek/tabular' },

    -- Comments
    { 'tpope/vim-commentary' },

    -- Motions
    { 'easymotion/vim-easymotion' },

    -- Multiple cursors
    { 'terryma/vim-multiple-cursors' },

    -- Snippets
    { 'SirVer/ultisnips' },
    { 'honza/vim-snippets' },

    -- Surroundings
    { 'jiangmiao/auto-pairs' },
    { 'tpope/vim-surround' },

    -- Swap arguments in parens
    { 'machakann/vim-swap' },

    -- Add more vim objects
    { 'wellle/targets.vim' },
    { 'tpope/vim-unimpaired' },

    -- Save persistent sessions on a workspace
    { 'thaerkh/vim-workspace' },

    -------------
    --  Tools  --
    -------------
    -- Git mergetool
    { 'whiteinge/diffconflicts' },

    -- Fuzzy finder
    --{ '/usr/bin/fzf' },
    { 'junegunn/fzf.vim' },

    -- Focus with :Goyo
    { 'junegunn/goyo.vim', },
    { 'junegunn/limelight.vim' },

    -- Neovim tree
    { 'kyazdani42/nvim-tree.lua' },

    -- Tags
    { 'liuchengxu/vista.vim' },

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
      open_fn = require "packer.util".float
    }
  }
}

require 'plugins.ale'
require 'plugins.autopairs'
require 'plugins.colorscheme'
require 'plugins.completion'
require 'plugins.easymotion'
require 'plugins.emmet'
require 'plugins.fzf'
require 'plugins.gitgutter'
require 'plugins.goyo'
require 'plugins.indent_guides'
require 'plugins.neovim_tree'
require 'plugins.omnisharp'
require 'plugins.ultisnips'
require 'plugins.workspace'

-- vim: foldmethod=marker
