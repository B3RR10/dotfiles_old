local fn = vim.fn

-- Install lazy.nvim
local lazypath = fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Auto install packer.nvim if not exists
-- local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   exec('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
-- end
--
-- cmd([[packadd packer.nvim]])

-- local packerGrp = vim.api.nvim_create_augroup('PackerAutoCompile', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   pattern = '*/lua/plugins/init.lua',
--   command = [[source <afile> | PackerCompile]],
--   group = packerGrp,
-- })

require('lazy').setup({
  {
    ---------------
    --  Visuals  --
    ---------------
    -- DONE
    {
      'rebelot/kanagawa.nvim',
      config = function()
        require('plugins.colorscheme').setup()
      end,
    },
    -- DONE
    { 'kyazdani42/nvim-web-devicons' },
    {
      -- DONE
      'hoob3rt/lualine.nvim',
      config = function()
        require('plugins.lualine').setup()
      end,
    },
    -- DONE
    { 'akinsho/nvim-bufferline.lua' },

    -- Git
    -- { 'f-person/git-blame.nvim' },
    -- DONE
    {
      'lewis6991/gitsigns.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('plugins.gitsigns').setup()
      end,
    },
    -- DONE
    {
      'rhysd/committia.vim',
      config = function()
        require('plugins.commitia').setup()
      end,
    },

    -- Highlight word under cursor
    -- DONE
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
    -- {
    --   'OmniSharp/omnisharp-vim',
    --   config = function()
    --     require('plugins.omnisharp').setup()
    --   end,
    -- },

    -- Editorconfig
    { 'editorconfig/editorconfig-vim' },

    -- F#
    -- { 'ionide/Ionide-vim' },

    -- Git
    { 'tpope/vim-git' },

    -- HTML
    {
      'mattn/emmet-vim',
      init = function()
        require('plugins.emmet').setup()
      end,
      ft = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'vue' },
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
      dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
      },
      config = function()
        require('plugins.mason').setup()
      end,
      build = ':MasonUpdate',
    },
    {
      'neovim/nvim-lspconfig',
      config = function()
        require('plugins.lsp').setup()
      end,
      dependencies = {
        'b0o/schemastore.nvim',
        'mason.nvim',
        'Hoffs/omnisharp-extended-lsp.nvim',
      },
    },
    -- DONE
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'ray-x/cmp-treesitter',
        'onsails/lspkind-nvim',
      },
      config = function()
        require('plugins.cmp').setup()
      end,
    },
    {
      'mfussenegger/nvim-lint',
      config = function()
        vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
          callback = function()
            require('lint').try_lint()
          end,
        })
      end,
      dependencies = {
        'mason.nvim',
      },
    },
    {
      'mhartington/formatter.nvim',
      config = function()
        require('plugins.formatter').setup()
      end,
      dependencies = {
        'mason.nvim',
      },
    },
    -- DONE
    {
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'JoosepAlviste/nvim-ts-context-commentstring',
      },
      build = ':TSUpdate',
      config = function()
        require('plugins.treesitter').setup()
      end,
    },
    -- NOOP
    {
      'liuchengxu/vista.vim',
      config = function()
        require('plugins.vista').setup()
      end,
    },

    --------------
    --  Editor  --
    --------------

    -- Additional text-objects
    -- DONE
    { 'wellle/targets.vim' },

    -- Multiple cursors
    -- NOOP
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
    -- DONE
    {
      'L3MON4D3/LuaSnip',
      version = '1.*',
      dependencies = {
        'honza/vim-snippets',
        'rafamadriz/friendly-snippets',
      },
      config = function()
        require('plugins.luasnip').setup()
      end,
      run = 'make install_jsregexp',
    },

    -- mini.nvim
    -- DONE
    {
      'echasnovski/mini.nvim',
      config = function()
        require('plugins.mini').setup()
      end,
    },

    -- Surroundings
    -- DONE
    {
      'jiangmiao/auto-pairs',
      config = function()
        require('plugins.autopairs').setup()
      end,
    },

    -- Save persistent sessions
    -- DONE
    {
      'rmagatti/auto-session',
      config = function()
        require('plugins.auto-session').setup()
      end,
    },

    -- Enhance vim.ui interface
    -- DONE
    {
      'stevearc/dressing.nvim',
      config = function()
        require('dressing').setup()
      end,
    },

    -- Auto shrinks windows when not enough space
    -- DONE: Replaced by focus.nvim
    {
      'anuvyklack/windows.nvim',
      dependencies = {
        'anuvyklack/middleclass',
        'anuvyklack/animation.nvim',
      },
      config = function()
        require('plugins.windows').setup()
      end,
    },

    -- Display possible keybindings
    -- DONE
    {
      'folke/which-key.nvim',
      config = true,
    },

    -------------
    --  Tools  --
    -------------
    -- Git mergetool
    -- DONE
    { 'whiteinge/diffconflicts' },

    -- Fuzzy finder
    -- DONE: Replaced with Telescope
    {
      'ibhagwan/fzf-lua',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
      config = function()
        require('plugins.fzf').setup()
      end,
    },

    -- Zen mode
    -- DONE
    {
      'folke/zen-mode.nvim',
      dependencies = { 'folke/twilight.nvim' },
      config = function()
        require('plugins.zen_mode').setup()
      end,
    },

    -- HTTP Client
    {
      'NTBBloodbath/rest.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      ft = { 'http' },
      config = function()
        require('plugins.rest').setup()
      end,
    },

    -- Neovim tree
    -- DONE: Replace with mini.files
    {
      'kyazdani42/nvim-tree.lua',
      config = function()
        require('plugins.neovim_tree').setup()
      end,
    },

    -- Nvim colorizer #666666
    -- DONE
    {
      'norcalli/nvim-colorizer.lua',
      config = true,
    },

    -- Noop
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

    -- LazyGit as Git UI
    -- DONE
    {
      'kdheepak/lazygit.nvim',
      config = function()
        require('plugins.lazygit').setup()
      end,
    },

    -- Render markdown files
    {
      'ellisonleao/glow.nvim',
    },

    ------------
    --  Misc  --
    ------------
    -- Toggle quickfix with \q and location list with \l
    { 'milkypostman/vim-togglelist' },
  },
})

-- vim: foldmethod=marker
