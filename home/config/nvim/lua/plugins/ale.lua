local map = require('settings.utils').map

vim.g.ale_linters = {
  cs = { 'OmniSharp' },
  python = { 'pyls' },
  ruby = { 'solargraph' },
  rust = { 'analyzer', 'cargo' },
  sh = { 'shellcheck', 'language_server' },
  tex = { 'chktex', 'lacheck', 'vale' },
  vim = { 'vint' },
}

vim.g.ale_vim_vimls_executable =
  '$HOME/.local/share/vim-lsp-settings/servers/vim-language-server/vim-language-server'

vim.g.ale_fixers = {
  lua = { 'lua-format', 'remove_trailing_lines', 'trim_whitespace' },
  python = { 'isort', 'autopep8', 'yapf', 'remove_trailing_lines' },
  rust = { 'rustfmt' },
  sh = { 'shfmt' },
  tex = { 'latexindent' },
}

vim.g.ale_lua_lua_format_options =
  '--indent-width=2 --continuation-indent-width=2 --tab-width=2 --spaces-inside-table-braces --extra-sep-at-table-end'

vim.g.ale_rust_cargo_use_check = 1
vim.g.ale_rust_cargo_check_all_targets = 1
vim.g.ale_rust_cargo_check_tests = 1
vim.g.ale_rust_cargo_check_examples = 1
vim.g.ale_rust_cargo_use_clippy = 1

vim.g.ale_fix_on_save = 1

map('n', '[a', '<Plug>(ale_previous_wrap)', { noremap = false })
map('n', ']a', '<Plug>(ale_next_wrap)', { noremap = false })
