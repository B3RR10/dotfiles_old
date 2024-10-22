local M = {}

function M.setup()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'bash',
      'bibtex',
      'c_sharp',
      'css',
      'diff',
      'dockerfile',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'go',
      'graphql',
      'hcl',
      'html',
      'http',
      'ini',
      'javascript',
      'jq',
      'json',
      'json5',
      'latex',
      'lua',
      'luadoc',
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
      'terraform',
      'toml',
      'typescript',
      'vim',
      'vue',
      'yaml',
    },
    highlight = {
      enable = true,
    },
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
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      lsp_interop = {
        enable = true,
        border = 'none',
        peek_definition_code = {
          ['<space>df'] = '@function.outer',
          ['<space>dF'] = '@class.outer',
        },
      },
    },
    context_commentstring = {
      enable = true,
    },
  })

  vim.cmd('setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()')
end

return M
