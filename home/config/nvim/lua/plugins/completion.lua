vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.shortmess:append('c')

require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  resolve_timeout = 800,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,

  source = {
    omni = { Filetypes = { 'tex', 'cs' } },
    path = true,
    buffer = true,
    spell = { Filetypes = { 'markdown', 'tex' } },
    emoji = true,
    nvim_lsp = true,
    nvim_lua = true,
    ultisnips = true,
    calc = true,
  },
}

require('vim.lsp.protocol').CompletionItemKind = {
  'ﮜ [text]', ' [method]', ' [function]', ' [constructor]', 'ﰠ [field]',
  ' [variable]', ' [class]', ' [interface]', ' [module]', ' [property]',
  ' [unit]', ' [value]', ' [enum]', ' [key]', ' [snippet]', ' [color]',
  ' [file]', ' [reference]', ' [folder]', ' [enum member]', ' [constant]',
  ' [struct]', '⌘ [event]', ' [operator]', '⌂ [type]',
}
