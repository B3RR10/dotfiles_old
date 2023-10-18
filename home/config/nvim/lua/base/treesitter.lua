return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      sync_install = false,
      ensure_installed = {
        'css',
        'diff',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'graphql',
        'html',
        'http',
        'ini',
        'javascript',
        'make',
        'markdown',
        'markdown_inline',
        'ninja',
        'nix',
        'python',
        'regex',
        'rst',
        'rust',
        'scss',
        'sql',
        'toml',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
      },
      highlight = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['g>'] = '@parameter.inner',
          },
          swap_previous = {
            ['g<'] = '@parameter.inner',
          },
        },
      },
      context_commentstring = {
        enable = true,
      },
    },
    config = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        --@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
