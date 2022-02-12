local M = {}

function M.setup()
  local map = require('settings.utils').map

  vim.g.ale_linters = {
    cs = { 'OmniSharp' },
    eruby = { 'erblint' },
    python = { 'pyls' },
    ruby = { 'solargraph', 'sorbet', 'rails_best_practices', 'rubocop' },
    rust = { 'analyzer', 'cargo' },
    sh = { 'shellcheck', 'language_server' },
    tex = { 'chktex', 'lacheck', 'vale' },
    vim = { 'vint' },
  }

  vim.g.ale_vim_vimls_executable = '$HOME/.local/share/vim-lsp-settings/servers/vim-language-server/vim-language-server'

  vim.g.ale_fixers = {
    css = { 'prettier' },
    eruby = { 'erblint' },
    html = { 'prettier' },
    javascript = { 'prettier' },
    json = { 'prettier' },
    lua = { 'stylua', 'remove_trailing_lines', 'trim_whitespace' },
    python = { 'isort', 'autopep8', 'yapf', 'remove_trailing_lines' },
    ruby = { 'prettier', 'rubocop', 'sorbet' },
    rust = { 'rustfmt' },
    sh = { 'shfmt' },
    typescript = { 'prettier' },
    tex = { 'latexindent' },
  }

  vim.g.ale_lua_stylua_options = '--indent-type Spaces --indent-width 2 --quote-style AutoPreferSingle'

  vim.g.ale_rust_cargo_use_check = 1
  vim.g.ale_rust_cargo_check_all_targets = 1
  vim.g.ale_rust_cargo_check_tests = 1
  vim.g.ale_rust_cargo_check_examples = 1
  vim.g.ale_rust_cargo_use_clippy = 1

  vim.g.ale_fix_on_save = 1

  map('n', '[a', '<Plug>(ale_previous_wrap)', { noremap = false })
  map('n', ']a', '<Plug>(ale_next_wrap)', { noremap = false })
end

return M
